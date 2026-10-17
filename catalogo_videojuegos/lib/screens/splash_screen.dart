import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

// Segundos que dura la pantalla de bienvenida (3 por default).
// Solo se cambia al compilar con --dart-define=SPLASH=10 para tomar capturas.
const int segundosSplash = int.fromEnvironment('SPLASH', defaultValue: 3);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Despues de 3 segundos pasamos a la pantalla principal
    Timer(const Duration(seconds: segundosSplash), () {
      if (!mounted) return;
      // pushReplacement para que no se pueda regresar al splash con el boton atras
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo: un circulo blanco con el icono de un control de videojuegos
            Container(
              padding: const EdgeInsets.all(28),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.sports_esports, size: 80, color: color),
            ),
            const SizedBox(height: 24),
            const Text(
              'Catálogo Gamer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tus videojuegos favoritos',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 40),
            // Animacion de carga
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
