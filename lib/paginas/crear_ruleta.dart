import 'package:flutter/material.dart';
import 'package:myapp/main.dart'; // Importante para acceder a la lista global

class PantallaCrearRuleta extends StatefulWidget {
  const PantallaCrearRuleta({super.key});

  @override
  State<PantallaCrearRuleta> createState() => _PantallaCrearRuletaState();
}

class _PantallaCrearRuletaState extends State<PantallaCrearRuleta> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _optionController = TextEditingController();
  List<String> opciones = [];

  void _guardarRuleta() {
    if (_nameController.text.isNotEmpty && opciones.length >= 2) {
      // AÑADIR A LA LISTA GLOBAL
      listaGlobalRuletas.add({
        'nombre': _nameController.text,
        'esFav': false,
        'opciones': List<String>.from(opciones),
      });
      // IR A LA PANTALLA DE MIS RULETAS
      Navigator.pushNamed(context, '/mis_ruletas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(title: const Text('Configuración'), backgroundColor: Colors.blueAccent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Nombre de la ruleta'),
            TextField(controller: _nameController, decoration: const InputDecoration(filled: true, fillColor: Colors.white, border: OutlineInputBorder())),
            const SizedBox(height: 20),
            Container(
              height: 110, width: 110,
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(), color: Colors.white),
              child: TextField(
                controller: _optionController, textAlign: TextAlign.center,
                decoration: const InputDecoration(hintText: 'Escribe\nalgo', border: InputBorder.none),
                onSubmitted: (val) {
                  if (val.isNotEmpty) setState(() { opciones.add(val); _optionController.clear(); });
                },
              ),
            ),
            const Text('se necesitan minimo 2 opc', style: TextStyle(color: Colors.red, decoration: TextDecoration.underline)),
            const SizedBox(height: 20),
            // Cuadro de opciones
            Container(
              width: double.infinity, decoration: BoxDecoration(border: Border.all(), color: Colors.white),
              child: Column(
                children: opciones.asMap().entries.map((e) => ListTile(
                  title: Text('Opción ${e.key + 1}: ${e.value}'),
                  trailing: IconButton(icon: const Icon(Icons.close, color: Colors.red), onPressed: () => setState(() => opciones.removeAt(e.key))),
                )).toList(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: opciones.length >= 2 ? _guardarRuleta : null,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('CREAR Y GUARDAR', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey, unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cuenta'),
        ],
        onTap: (i) { if(i==0) Navigator.pushNamed(context, '/'); },
      ),
    );
  }
}