import 'package:flutter/material.dart';
import '../data/favoritos.dart';
import '../data/videojuegos_data.dart';
import '../models/videojuego.dart';
import '../widgets/tarjeta_videojuego.dart';
import 'detalle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String categoriaSeleccionada = 'Todos';
  String textoBusqueda = '';
  // Regresa los videojuegos que cumplen con la categoria y la busqueda
  List<Videojuego> _filtrarVideojuegos() {
    return videojuegos.where((juego) {
      final coincideCategoria = categoriaSeleccionada == 'Todos' ||
          juego.categoria == categoriaSeleccionada;
      final coincideBusqueda =
          juego.nombre.toLowerCase().contains(textoBusqueda.toLowerCase());
      return coincideCategoria && coincideBusqueda;
    }).toList();
  }

  // Abre la pantalla de detalle del videojuego seleccionado
  Future<void> _abrirDetalle(Videojuego juego) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        // aqui le pasamos el objeto seleccionado
        builder: (context) => DetalleScreen(videojuego: juego),
      ),
    );

    // Cuando se cierra el detalle volvemos a dibujar la lista,
    // asi se actualizan los corazones de favoritos
    if (!mounted) return;
    setState(() {});
  }

  void _mostrarPerfil() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Perfil'),
        content: Text('Videojuegos favoritos: ${favoritos.length}'),
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
    final listaFiltrada = _filtrarVideojuegos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo Gamer'),
        actions: [
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
                hintText: 'Buscar un videojuego...',
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

          // Lista de videojuegos
          Expanded(
            child: listaFiltrada.isEmpty
                ? const Center(child: Text('No se encontraron videojuegos'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: listaFiltrada.length,
                    itemBuilder: (context, index) {
                      final juego = listaFiltrada[index];
                      return TarjetaVideojuego(
                        videojuego: juego,
                        esFavorito: favoritos.contains(juego.id),
                        onTap: () => _abrirDetalle(juego),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
