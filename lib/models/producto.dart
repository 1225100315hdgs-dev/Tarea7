// Modelo de datos: representa un producto o servicio de la vidrieria.
class Producto {
  final String id;
  final String nombre;
  final String categoria;
  final String descripcionCorta; // se muestra en la tarjeta
  final String descripcionLarga; // se muestra en el detalle
  final String imagen; // ruta de la imagen dentro de lib/assets/
  final String material;
  final String garantia;
  final String precio;
  final String entrega;
  final double calificacion;
  final String consejo;
  final int color; // color propio de cada producto (ej. 0xFF00838F)
  final List<String> caracteristicas;

  const Producto({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.descripcionCorta,
    required this.descripcionLarga,
    required this.imagen,
    required this.material,
    required this.garantia,
    required this.precio,
    required this.entrega,
    required this.calificacion,
    required this.consejo,
    required this.color,
    required this.caracteristicas,
  });
}
