import 'package:flutter/material.dart';
import '../data/banco_preguntas.dart';
import 'pantalla_lista_tests.dart';

class PantallaTestTemas extends StatelessWidget {
  const PantallaTestTemas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C),
        foregroundColor: Colors.white,
        title: const Text('Test por Temas'),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: temas.length,
        itemBuilder: (context, i) {
          final tema = temas[i];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF4A148C),
                child: Text(
                  '${tema['id']}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                tema['nombre'],
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: const Text('30 tests disponibles'),
              trailing: const Icon(Icons.chevron_right, color: Color(0xFF4A148C)),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PantallaListaTests(
                    temaId: tema['id'],
                    temaNombre: tema['nombre'],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}