import 'package:flutter_test/flutter_test.dart';
import 'package:catalogo_videojuegos/data/videojuegos_data.dart';

void main() {
  test('la lista de videojuegos no esta vacia', () {
    expect(videojuegos.isNotEmpty, true);
  });

  test('cada videojuego tiene un id distinto', () {
    final ids = videojuegos.map((v) => v.id).toSet();
    expect(ids.length, videojuegos.length);
  });

  test('la categoria de cada videojuego existe en la lista de categorias', () {
    for (final juego in videojuegos) {
      expect(categorias.contains(juego.categoria), true);
    }
  });

  test('cada videojuego tiene al menos 3 caracteristicas', () {
    for (final juego in videojuegos) {
      expect(juego.caracteristicas.length >= 3, true);
    }
  });
}
