// Modelo de datos: representa un videojuego del catalogo.
class Videojuego {
  final String id;
  final String nombre;
  final String categoria;
  final String descripcionCorta; // se muestra en la tarjeta
  final String descripcionLarga; // se muestra en el detalle
  final String imagen; // ruta de la imagen dentro de assets/
  final String desarrollador;
  final int anio;
  final String plataformas;
  final double calificacion;
  final String datoCurioso;
  final String genero;
  final String jugadores;
  final int color; // color propio de cada juego (ej. 0xFF2E7D32)
  final List<String> caracteristicas;

  const Videojuego({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.descripcionCorta,
    required this.descripcionLarga,
    required this.imagen,
    required this.desarrollador,
    required this.anio,
    required this.plataformas,
    required this.calificacion,
    required this.datoCurioso,
    required this.genero,
    required this.jugadores,
    required this.color,
    required this.caracteristicas,
  });
}
