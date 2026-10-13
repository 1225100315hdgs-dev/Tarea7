import '../models/producto.dart';

// Categorias que aparecen como chips en la pantalla principal.
const List<String> categorias = [
  'Todos',
  'Ventanas',
  'Puertas',
  'Baños',
  'Espejos',
  'Muebles',
  'Exteriores',
];

// Datos de ejemplo (mock data). Los precios, tiempos de entrega,
// garantias y calificaciones son inventados, solo sirven para la app.
const List<Producto> productos = [
  Producto(
    id: 'ventana',
    nombre: 'Ventana corrediza de aluminio',
    categoria: 'Ventanas',
    descripcionCorta: 'Ventana de dos hojas, ideal para sala o recámara.',
    descripcionLarga:
        'Ventana corrediza con marco de aluminio y vidrio claro. Una de las '
        'hojas se desliza sobre la otra, por eso no ocupa espacio al abrirse. '
        'Se fabrica a la medida del hueco de tu casa.',
    imagen: 'lib/assets/images/ventana.png',
    material: 'Aluminio y vidrio de 6 mm',
    garantia: '1 año',
    precio: 'Desde \$1,800 MXN',
    entrega: '3 a 5 días',
    calificacion: 4.7,
    consejo: 'Mide el ancho y el alto del hueco en tres puntos y usa la medida más pequeña.',
    color: 0xFF00838F,
    caracteristicas: [
      'Se fabrica a la medida',
      'Marco de aluminio que no se oxida',
      'Cierre con seguro',
      'Fácil de limpiar',
    ],
  ),
  Producto(
    id: 'puerta',
    nombre: 'Puerta de vidrio templado',
    categoria: 'Puertas',
    descripcionCorta: 'Puerta elegante que deja pasar la luz.',
    descripcionLarga:
        'Puerta hecha con vidrio templado, un vidrio que recibe un '
        'tratamiento de calor para hacerlo más resistente que el vidrio '
        'normal. Se usa en oficinas, locales y también en casas.',
    imagen: 'lib/assets/images/puerta.png',
    material: 'Vidrio templado de 10 mm',
    garantia: '1 año',
    precio: 'Desde \$4,500 MXN',
    entrega: '5 a 7 días',
    calificacion: 4.8,
    consejo: 'El vidrio templado no se puede cortar después, por eso las medidas deben ser exactas.',
    color: 0xFF1565C0,
    caracteristicas: [
      'Más resistente que el vidrio normal',
      'Si se rompe, se hace pedazos pequeños',
      'Herrajes de acero inoxidable',
      'Diseño moderno',
    ],
  ),
  Producto(
    id: 'cancel',
    nombre: 'Cancel de baño',
    categoria: 'Baños',
    descripcionCorta: 'Separa la regadera sin que se moje el baño.',
    descripcionLarga:
        'Cancel de vidrio para la regadera. Mantiene el agua dentro de la '
        'zona de baño y hace que el espacio se vea más amplio y limpio que '
        'con una cortina.',
    imagen: 'lib/assets/images/cancel.png',
    material: 'Vidrio templado y herrajes de acero',
    garantia: '1 año',
    precio: 'Desde \$3,200 MXN',
    entrega: '4 a 6 días',
    calificacion: 4.6,
    consejo: 'Sécalo con un jalador después de bañarte para que no se marque el agua.',
    color: 0xFF00695C,
    caracteristicas: [
      'Sustituye la cortina de baño',
      'Puerta abatible o corrediza',
      'Se instala con sellador contra el agua',
      'Se ve más amplio el baño',
    ],
  ),
  Producto(
    id: 'espejo',
    nombre: 'Espejo con luz LED',
    categoria: 'Espejos',
    descripcionCorta: 'Espejo para baño o tocador con luz integrada.',
    descripcionLarga:
        'Espejo con iluminación LED en el borde. Da buena luz para '
        'peinarte, maquillarte o rasurarte, y le da un toque moderno al '
        'baño o a la recámara.',
    imagen: 'lib/assets/images/espejo.png',
    material: 'Vidrio con plata y luz LED',
    garantia: '6 meses',
    precio: 'Desde \$1,500 MXN',
    entrega: '3 a 5 días',
    calificacion: 4.5,
    consejo: 'Cuélgalo cerca de un contacto para que el cable no se vea.',
    color: 0xFF6A1B9A,
    caracteristicas: [
      'Luz LED en el contorno',
      'Se fabrica en varias formas y tamaños',
      'Consumo bajo de energía',
      'Bordes pulidos',
    ],
  ),
  Producto(
    id: 'mesa',
    nombre: 'Mesa con cubierta de vidrio',
    categoria: 'Muebles',
    descripcionCorta: 'Mesa de centro o comedor con cubierta transparente.',
    descripcionLarga:
        'Mesa con cubierta de vidrio templado y base de metal. El vidrio '
        'hace que el espacio se vea más ligero y combina con casi cualquier '
        'estilo de decoración.',
    imagen: 'lib/assets/images/mesa.png',
    material: 'Vidrio templado de 12 mm y base de metal',
    garantia: '6 meses',
    precio: 'Desde \$2,800 MXN',
    entrega: '5 a 8 días',
    calificacion: 4.4,
    consejo: 'Usa protectores de fieltro en la base para no rayar el piso.',
    color: 0xFF4E342E,
    caracteristicas: [
      'Cubierta de vidrio templado',
      'Base de metal resistente',
      'Esquinas redondeadas',
      'Fácil de limpiar',
    ],
  ),
  Producto(
    id: 'barandal',
    nombre: 'Barandal de vidrio',
    categoria: 'Exteriores',
    descripcionCorta: 'Barandal para balcones y escaleras sin tapar la vista.',
    descripcionLarga:
        'Barandal con paneles de vidrio y pasamanos de acero. Protege '
        'balcones, terrazas y escaleras sin tapar la vista, y deja pasar la '
        'luz natural.',
    imagen: 'lib/assets/images/barandal.png',
    material: 'Vidrio laminado y acero inoxidable',
    garantia: '2 años',
    precio: 'Desde \$2,200 MXN por metro',
    entrega: '7 a 10 días',
    calificacion: 4.9,
    consejo: 'Para exteriores pide vidrio laminado, porque si se rompe los pedazos quedan pegados.',
    color: 0xFF37474F,
    caracteristicas: [
      'Vidrio laminado de seguridad',
      'Pasamanos de acero inoxidable',
      'Resistente al sol y la lluvia',
      'No tapa la vista',
    ],
  ),
];
