import 'package:flutter/material.dart';
import '../models/producto.dart';

// Tarjeta que se muestra en la lista de la pantalla principal.
class TarjetaProducto extends StatelessWidget {
  final Producto producto;
  final bool esFavorito;
  final VoidCallback onTap;
  final bool usarHero; // en la lista de favoritos no se usa el Hero

  const TarjetaProducto({
    super.key,
    required this.producto,
    required this.esFavorito,
    required this.onTap,
    this.usarHero = true,
  });

  // Imagen de la tarjeta
  Widget _imagen() {
    return Image.asset(
      producto.imagen,
      height: 160,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // sombra de la tarjeta
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias, // para que la imagen respete las esquinas
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero: la misma imagen "viaja" hacia la pantalla de detalle
            usarHero ? Hero(tag: producto.id, child: _imagen()) : _imagen(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Expanded para que el titulo largo no cause overflow
                      Expanded(
                        child: Text(
                          producto.nombre,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (esFavorito)
                        const Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(producto.descripcionCorta),
                  const SizedBox(height: 6),
                  Text(
                    producto.precio,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(producto.color),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
