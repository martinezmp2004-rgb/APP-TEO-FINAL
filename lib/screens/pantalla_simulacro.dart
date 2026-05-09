import 'package:flutter/material.dart';
import '../data/banco_preguntas.dart';
import '../services/test_generator.dart';
import '../services/test_storage.dart';
import 'pantalla_test.dart';

class PantallaSimulacro extends StatelessWidget {
  const PantallaSimulacro({super.key});

  @override
  Widget build(BuildContext context) {
    final pool = todasLasPreguntas();

    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        foregroundColor: Colors.white,
        title: const Text('Simulacro de Examen'),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 100,
        itemBuilder: (context, i) {
          final testId = 'simulacro_$i';

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FutureBuilder<Map<String, dynamic>?>(
              future: TestStorage.loadTestState(testId),
              builder: (context, snap) {
                final estado = snap.data;
                final completado = estado != null && estado['completado'] == true;
                final nota = estado != null ? (estado['nota'] as num?)?.toDouble() : null;

                return ListTile(
                  tileColor: completado ? Colors.green[50] : Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  leading: CircleAvatar(
                    backgroundColor: completado ? Colors.green : const Color(0xFF1B5E20),
                    child: completado
                        ? const Icon(Icons.check, color: Colors.white, size: 18)
                        : Text('${i + 1}', style: const TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                  title: Text('Simulacro ${i + 1}', style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: completado && nota != null
                      ? Text(
                          'Nota: ${nota.toStringAsFixed(1)}/10 - ${nota >= 5 ? "Aprobado ✓" : "Suspenso ✗"}',
                          style: TextStyle(
                            color: nota >= 5 ? Colors.green[700] : Colors.red[700],
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : const Text('20 preguntas · Todos los temas'),
                  trailing: const Icon(Icons.play_arrow, color: Color(0xFF1B5E20)),
                  onTap: () async {
                    final preguntas = await TestGenerator.fixedQuestionsForTest(
                      testId: testId,
                      pool: pool,
                      cantidad: 20,
                    );
                    if (!context.mounted) return;

                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PantallaTest(
                          preguntas: preguntas,
                          titulo: 'Simulacro ${i + 1}',
                          testId: testId,
                        ),
                      ),
                    );

                    (context as Element).markNeedsBuild();
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}