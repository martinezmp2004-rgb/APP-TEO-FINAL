import 'package:flutter/material.dart';

import '../data/banco_preguntas.dart';
import '../services/test_generator.dart';
import '../services/test_storage.dart';
import 'pantalla_test.dart';

class PantallaListaTests extends StatefulWidget {
  final int temaId;
  final String temaNombre;

  const PantallaListaTests({
    super.key,
    required this.temaId,
    required this.temaNombre,
  });

  @override
  State<PantallaListaTests> createState() => _PantallaListaTestsState();
}

class _PantallaListaTestsState extends State<PantallaListaTests> {
  @override
  Widget build(BuildContext context) {
    final pool = getPreguntasTema(widget.temaId);

    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C),
        foregroundColor: Colors.white,
        title: Text(widget.temaNombre),
        elevation: 0,
      ),
      body: pool.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'Este tema todavía no tiene preguntas disponibles.',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 30,
              itemBuilder: (context, i) {
                final index = i + 1;
                final testId = 'tema_${widget.temaId}_test_$index';

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
                          backgroundColor: completado ? Colors.green : const Color(0xFF4A148C),
                          child: completado
                              ? const Icon(Icons.check, color: Colors.white, size: 18)
                              : Text(
                                  '$index',
                                  style: const TextStyle(color: Colors.white, fontSize: 13),
                                ),
                        ),
                        title: Text(
                          'Test $index',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: completado && nota != null
                            ? Text(
                                'Nota: ${nota.toStringAsFixed(1)}/10 - ${nota >= 5 ? "Aprobado ✓" : "Suspenso ✗"}',
                                style: TextStyle(
                                  color: nota >= 5 ? Colors.green[700] : Colors.red[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : const Text('10 preguntas del tema'),
                        trailing: const Icon(Icons.play_arrow, color: Color(0xFF4A148C)),
                        onTap: () async {
                          final preguntas = await TestGenerator.fixedQuestionsForTest(
                            testId: testId,
                            pool: pool,
                            cantidad: 10,
                          );
                          if (!context.mounted) return;

                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PantallaTest(
                                preguntas: preguntas,
                                titulo: '${widget.temaNombre} · Test $index',
                                testId: testId,
                              ),
                            ),
                          );

                          if (mounted) setState(() {});
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
