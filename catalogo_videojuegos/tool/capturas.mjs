// Script auxiliar solo para tomar las capturas del README (no es parte de la app).
import { chromium } from 'playwright';

const OUT = 'docs/screenshots';
const log = (m) => console.log('[capturas] ' + m);
const browser = await chromium.launch();
const ctx = await browser.newContext({
  viewport: { width: 412, height: 915 },
  deviceScaleFactor: 2,
});
const page = await ctx.newPage();

async function snap(nombre) {
  await page.screenshot({ path: `${OUT}/${nombre}.png` });
  log(nombre + ' ok');
}

// Hace clic en un elemento de Flutter buscando por texto (usa la capa de accesibilidad)
async function tocar(texto) {
  try {
    const el = page.locator(`[aria-label*="${texto}"]`).first();
    await el.click({ force: true, timeout: 8000 });
    return true;
  } catch (e) {
    log('no pude tocar "' + texto + '": ' + e.message.split('\n')[0]);
    return false;
  }
}

try {
  await page.goto('http://localhost:8080', { waitUntil: 'load' });
  await page.waitForSelector('flt-glass-pane', { timeout: 90000 });
  await page.waitForTimeout(3500);
  await snap('01_splash');

  // esperar a que termine el splash (14 s en esta version de prueba)
  await page.waitForTimeout(13000);
  await page.evaluate(() => document.querySelector('flt-semantics-placeholder')?.click());
  await page.waitForTimeout(2500);
  await snap('02_home');

  if (await tocar('Aventura')) {
    await page.waitForTimeout(800);
    await snap('03_filtro');
  }

  if (await tocar('Zelda')) {
    await page.waitForTimeout(1500);
    await snap('04_detalle');

    if (await tocar('Guardar en favoritos')) {
      await page.waitForTimeout(1200);
      await snap('05_favorito');

      // Desde el detalle abrimos el de otro juego
      await page.waitForTimeout(4500);
      if (await tocar('Mario Kart')) {
        await page.waitForTimeout(1500);
        await snap('06_otro_juego');
      }
    }
  }
} catch (e) {
  log('error: ' + e.message);
}

await browser.close();
