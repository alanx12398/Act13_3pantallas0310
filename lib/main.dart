import 'package:flutter/material.dart';
import 'package:myapp/paginas/crear_ruleta.dart';
import 'package:myapp/paginas/inicio.dart';
import 'package:myapp/paginas/misruletas.dart';

// Definición de la lista global de ruletas
List<Map<String, dynamic>> listaGlobalRuletas = [];

void main() {
  runApp(const RuletaApp());
}

class RuletaApp extends StatelessWidget {
  const RuletaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ruleta App - Alan Pacheco 6J',
      // Configuración de Rutas Nombradas
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaInicio(),
        '/mis_ruletas': (context) => const PantallaMisRuletas(),
        '/crear_ruleta': (context) => const PantallaCrearRuleta(),
      },
    );
  }
}
