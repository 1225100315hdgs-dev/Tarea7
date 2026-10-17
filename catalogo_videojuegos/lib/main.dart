import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo Gamer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Color base de la app (morado, estilo gamer)
        colorSchemeSeed: Colors.redAccent,
        useMaterial3: true,
      ),
      // La app empieza en el splash
      home: const SplashScreen(),
    );
  }
}
