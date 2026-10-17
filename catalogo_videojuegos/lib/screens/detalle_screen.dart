import 'package:flutter/material.dart';
import '../data/favoritos.dart';
import '../data/videojuegos_data.dart';
import '../models/videojuego.dart';

// Pantalla de detalle: cada videojuego la abre con sus propios datos y su color.
class DetalleScreen extends StatefulWidget {
  final Videojuego videojuego;

  const DetalleScreen({super.key, required this.videojuego});

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  // Atajos para no escribir widget.videojuego a cada rato
  Videojuego get juego => widget.videojuego;
  bool get esFavorito => favoritos.contains(juego.id);

  void _cambiarFavorito() {
    setState(() {
      if (esFavorito) {
        favoritos.remove(juego.id);
      } else {
        favoritos.add(juego.id);
      }
    });

    final mensaje = esFavorito
        ? '${juego.nombre} se agregó a favoritos'
        : '${juego.nombre} se quitó de favoritos';
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  // Widget pequeno para mostrar un icono con su texto abajo
  Widget _dato(IconData icono, String texto, Color color) {
    return Expanded(
      child: Column(
        children: [
          Icon(icono, size: 28, color: color),
          const SizedBox(height: 4),
          Text(texto, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Cada juego tiene su propio color
    final color = Color(juego.color);
    // Los demas juegos del catalogo (para la seccion "Más juegos")
    final otros = videojuegos.where((v) => v.id != juego.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(juego.categoria),
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen con esquinas redondeadas y el mismo tag del Hero de la tarjeta
            Padding(
              padding: const EdgeInsets.all(16),
              child: Hero(
                tag: juego.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    juego.imagen,
                    height: 230,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    juego.nombre,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Desarrollado por ${juego.desarrollador}',
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),

                  // Etiquetas con el genero y el numero de jugadores
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      Chip(
                        avatar: Icon(Icons.category, size: 18, color: color),
                        label: Text(juego.genero),
                      ),
                      Chip(
                        avatar: Icon(Icons.people, size: 18, color: color),
                        label: Text(juego.jugadores),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Fila con plataformas, año y calificacion
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _dato(Icons.sports_esports, juego.plataformas, color),
                      _dato(Icons.calendar_today, '${juego.anio}', color),
                      _dato(Icons.star, '${juego.calificacion} / 5', color),
                    ],
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Acerca del juego',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(juego.descripcionLarga,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),

                  // Lista de caracteristicas del juego
                  const Text(
                    'Características',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  for (final caracteristica in juego.caracteristicas)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.check_circle, size: 20, color: color),
                          const SizedBox(width: 8),
                          Expanded(child: Text(caracteristica)),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),

                  // Recuadro con el dato curioso
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.withAlpha(30),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.lightbulb, color: color),
                        const SizedBox(width: 10),
                        Expanded(child: Text(juego.datoCurioso)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Boton de accion
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _cambiarFavorito,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        foregroundColor: Colors.white,
                      ),
                      icon: Icon(
                        esFavorito ? Icons.favorite : Icons.favorite_border,
                      ),
                      label: Text(
                        esFavorito
                            ? 'Quitar de favoritos'
                            : 'Guardar en favoritos',
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Otros juegos: al tocarlos se abre su propia pantalla de detalle
                  const Text(
                    'Más juegos',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: otros.length,
                      itemBuilder: (context, index) {
                        final otro = otros[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetalleScreen(videojuego: otro),
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.only(right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    otro.imagen,
                                    height: 95,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  otro.nombre,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
