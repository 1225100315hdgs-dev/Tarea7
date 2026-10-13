import 'package:flutter/material.dart';
import '../data/favoritos.dart';
import '../data/productos_data.dart';
import '../models/producto.dart';

// Pantalla de detalle: cada producto la abre con sus propios datos y su color.
class DetalleScreen extends StatefulWidget {
  final Producto producto;

  const DetalleScreen({super.key, required this.producto});

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  // Atajos para no escribir widget.producto a cada rato
  Producto get producto => widget.producto;
  bool get esFavorito => favoritos.contains(producto.id);

  void _cambiarFavorito() {
    setState(() {
      if (esFavorito) {
        favoritos.remove(producto.id);
      } else {
        favoritos.add(producto.id);
      }
    });

    final mensaje = esFavorito
        ? '${producto.nombre} se agregó a favoritos'
        : '${producto.nombre} se quitó de favoritos';
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  // Muestra un mensaje de que la cotizacion se envio (es una simulacion)
  void _solicitarCotizacion() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cotización solicitada'),
        content: Text(
          'Enviamos tu solicitud para "${producto.nombre}". '
          'Un asesor te contactará pronto.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
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
    // Cada producto tiene su propio color
    final color = Color(producto.color);
    // Los demas productos del catalogo (para la seccion "Más productos")
    final otros = productos.where((p) => p.id != producto.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(producto.categoria),
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
                tag: producto.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    producto.imagen,
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
                    producto.nombre,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Etiquetas con el material y la garantia
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      Chip(
                        avatar: Icon(Icons.layers, size: 18, color: color),
                        label: Text(producto.material),
                      ),
                      Chip(
                        avatar: Icon(Icons.verified, size: 18, color: color),
                        label: Text('Garantía: ${producto.garantia}'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Fila con precio, entrega y calificacion
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _dato(Icons.attach_money, producto.precio, color),
                      _dato(Icons.local_shipping, producto.entrega, color),
                      _dato(Icons.star, '${producto.calificacion} / 5', color),
                    ],
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Descripción',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(producto.descripcionLarga,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),

                  // Lista de caracteristicas del producto
                  const Text(
                    'Características',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  for (final caracteristica in producto.caracteristicas)
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

                  // Recuadro con el consejo
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
                        Expanded(child: Text(producto.consejo)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Botones de accion
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _solicitarCotizacion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.request_quote),
                      label: const Text('Solicitar cotización'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: _cambiarFavorito,
                      icon: Icon(
                        esFavorito ? Icons.favorite : Icons.favorite_border,
                        color: color,
                      ),
                      label: Text(
                        esFavorito
                            ? 'Quitar de favoritos'
                            : 'Guardar en favoritos',
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Otros productos: al tocarlos se abre su propia pantalla de detalle
                  const Text(
                    'Más productos',
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
                                    DetalleScreen(producto: otro),
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
