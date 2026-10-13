import 'package:flutter/material.dart';
import '../data/favoritos.dart';
import '../data/productos_data.dart';
import '../widgets/tarjeta_producto.dart';
import 'detalle_screen.dart';

// Muestra solo los productos que el usuario marco como favoritos.
class FavoritosScreen extends StatefulWidget {
  const FavoritosScreen({super.key});

  @override
  State<FavoritosScreen> createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {
  @override
  Widget build(BuildContext context) {
    // Tomamos del catalogo solo los productos cuyo id esta en favoritos
    final lista = productos.where((p) => favoritos.contains(p.id)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Mis favoritos')),
      body: lista.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                    SizedBox(height: 12),
                    Text(
                      'Todavía no tienes productos favoritos',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: lista.length,
              itemBuilder: (context, index) {
                final producto = lista[index];
                return TarjetaProducto(
                  producto: producto,
                  esFavorito: true,
                  usarHero: false,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleScreen(producto: producto),
                      ),
                    );
                    // Si lo quitaron de favoritos, se actualiza la lista
                    if (!mounted) return;
                    setState(() {});
                  },
                );
              },
            ),
    );
  }
}
