import 'package:flutter/material.dart';
import '../models/videojuego.dart';

// Tarjeta que se muestra en la lista de la pantalla principal.
class TarjetaVideojuego extends StatelessWidget {
  final Videojuego videojuego;
  final bool esFavorito;
  final VoidCallback onTap;

  const TarjetaVideojuego({
    super.key,
    required this.videojuego,
    required this.esFavorito,
    required this.onTap,
  });

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
            Hero(
              tag: videojuego.id,
              child: Image.asset(
                videojuego.imagen,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
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
                          videojuego.nombre,
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
                  Text(videojuego.descripcionCorta),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
