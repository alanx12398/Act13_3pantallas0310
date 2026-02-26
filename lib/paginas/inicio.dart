import 'package:flutter/material.dart';

// ---------------------------------------------------------
// PANTALLA 1: BIENVENIDO
// ---------------------------------------------------------
class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Alan Pacheco 6J'),
        backgroundColor: const Color.fromARGB(255, 68, 135, 235),
        actions: const [
          Icon(Icons.notifications),
          SizedBox(width: 10),
          Icon(Icons.settings),
          SizedBox(width: 15),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¡Bienvenido!', 
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
            const Text('¿Que vamos hacer hoy?', style: TextStyle(fontSize: 18)),
            const Text('¡Deja que el azar decida!', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            
            _botonMenu(context, 'Mis Ruletas', Colors.green, '/mis_ruletas'),
            _botonMenu(context, 'Crear Ruleta', Colors.blue, '/crear_ruleta'),
            _botonMenu(context, 'Biblioteca Ruletas', Colors.orange, null),
            _botonMenu(context, 'Historial', Colors.purple, null),
            
            const SizedBox(height: 20),
            const Icon(Icons.pie_chart, size: 100, color: Colors.amber),
            
            const SizedBox(height: 10),
            _botonMenu(context, 'Decisión del día', Colors.yellow.shade700, null),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Forzamos que tanto el seleccionado como el no seleccionado sean grises
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cuenta'),
        ],
        onTap: (index) {
          if (index == 1) print("Favoritos");
          if (index == 2) print("Cuenta");
        },
      ),
    );
  }

  Widget _botonMenu(BuildContext context, String texto, Color color, String? ruta) {
    return Container(
      width: 250,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: () {
          if (ruta != null) Navigator.pushNamed(context, ruta);
        },
        child: Text(texto, style: const TextStyle(color: Colors.black)),
      ),
    );
  }
}