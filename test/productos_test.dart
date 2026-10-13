import 'package:flutter_test/flutter_test.dart';
import 'package:vidrieria_cristal/data/productos_data.dart';

void main() {
  test('la lista de productos no esta vacia', () {
    expect(productos.isNotEmpty, true);
  });

  test('cada producto tiene un id distinto', () {
    final ids = productos.map((p) => p.id).toSet();
    expect(ids.length, productos.length);
  });

  test('la categoria de cada producto existe en la lista de categorias', () {
    for (final producto in productos) {
      expect(categorias.contains(producto.categoria), true);
    }
  });

  test('cada producto tiene al menos 3 caracteristicas', () {
    for (final producto in productos) {
      expect(producto.caracteristicas.length >= 3, true);
    }
  });
}
