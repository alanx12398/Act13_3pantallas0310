import 'package:flutter/material.dart';
import 'package:myapp/main.dart'; // Importa la lista global

class PantallaMisRuletas extends StatefulWidget {
  const PantallaMisRuletas({super.key});

  @override
  State<PantallaMisRuletas> createState() => _PantallaMisRuletasState();
}

class _PantallaMisRuletasState extends State<PantallaMisRuletas> {
  @override
  Widget build(BuildContext context) {
    // Nos aseguramos de que la lista no sea nula antes de construir el widget
    final ruletas = listaGlobalRuletas ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Ruletas'), 
        backgroundColor: Colors.green,
        // Agregamos acciones para que coincida con el estilo de las otras pantallas
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Mis Ruletas', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ruletas.length,
              itemBuilder: (context, i) => Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListTile(
                  leading: const Icon(Icons.list, color: Colors.blueGrey),
                  title: Text(ruletas[i]['nombre'] ?? 'Nombre no disponible'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ICONO ELIMINAR
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            listaGlobalRuletas.removeAt(i);
                          });
                        },
                      ),
                      // ICONO EDITAR (SOLO VISUAL)
                      const Icon(Icons.edit, color: Colors.grey),
                      const SizedBox(width: 8),
                      // ICONO REPRODUCIR
                      const Icon(Icons.play_arrow, color: Colors.green),
                      // ICONO FAVORITO
                      IconButton(
                        icon: Icon(
                          (ruletas[i]['esFav'] ?? false) ? Icons.favorite : Icons.favorite_border, 
                          color: Colors.red
                        ),
                        onPressed: () {
                          setState(() {
                            ruletas[i]['esFav'] = !(ruletas[i]['esFav'] ?? false);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Botón para ir a crear si la lista está vacía o queremos más
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/crear_ruleta'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
              child: const Text('Crear Nueva Ruleta', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, 
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
          if (index == 0) Navigator.pushNamed(context, '/'); 
        },
      ),
    );
  }
}