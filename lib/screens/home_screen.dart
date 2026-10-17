import 'package:flutter/material.dart';
import '../data/favoritos.dart';
import '../data/productos_data.dart';
import '../models/producto.dart';
import '../widgets/tarjeta_producto.dart';
import 'detalle_screen.dart';
import 'favoritos_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String categoriaSeleccionada = 'Todos';
  String textoBusqueda = '';

  // Regresa los productos que cumplen con la categoria y la busqueda
  List<Producto> _filtrarProductos() {
    return productos.where((producto) {
      final coincideCategoria = categoriaSeleccionada == 'Todos' ||
          producto.categoria == categoriaSeleccionada;
      final coincideBusqueda =
          producto.nombre.toLowerCase().contains(textoBusqueda.toLowerCase());
      return coincideCategoria && coincideBusqueda;
    }).toList();
  }

  // Abre la pantalla de detalle del producto seleccionado
  Future<void> _abrirDetalle(Producto producto) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        // aqui le pasamos el objeto seleccionado
        builder: (context) => DetalleScreen(producto: producto),
      ),
    );

    // Cuando se cierra el detalle volvemos a dibujar la lista,
    // asi se actualizan los corazones de favoritos
    if (!mounted) return;
    setState(() {});
  }

  // Abre la lista de productos favoritos
  Future<void> _abrirFavoritos() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavoritosScreen()),
    );
    if (!mounted) return;
    setState(() {});
  }

  void _mostrarPerfil() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Perfil'),
        content: Text('Productos favoritos: ${favoritos.length}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final listaFiltrada = _filtrarProductos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vidriería Cristal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            tooltip: 'Favoritos',
            onPressed: _abrirFavoritos,
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: _mostrarPerfil,
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de busqueda
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              onChanged: (valor) {
                setState(() {
                  textoBusqueda = valor;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar un producto...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          // Categorias (chips) en una lista horizontal
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(categoria),
                    selected: categoriaSeleccionada == categoria,
                    onSelected: (_) {
                      setState(() {
                        categoriaSeleccionada = categoria;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          // Lista de productos
          Expanded(
            child: listaFiltrada.isEmpty
                ? const Center(child: Text('No se encontraron productos'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: listaFiltrada.length,
                    itemBuilder: (context, index) {
                      final producto = listaFiltrada[index];
                      return TarjetaProducto(
                        producto: producto,
                        esFavorito: favoritos.contains(producto.id),
                        onTap: () => _abrirDetalle(producto),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
