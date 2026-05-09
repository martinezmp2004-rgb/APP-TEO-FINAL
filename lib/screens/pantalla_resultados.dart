import 'package:flutter/material.dart';
import '../models/pregunta.dart';
import '../widgets/grafico_pastel.dart';

class PantallaResultados extends StatelessWidget {
  final String titulo;
  final List<bool?> resultados;
  final List<Pregunta> preguntas;

  const PantallaResultados({
    super.key,
    required this.titulo,
    required this.resultados,
    required this.preguntas,
  });

  @override
  Widget build(BuildContext context) {
    final aciertos = resultados.where((r) => r == true).length;
    final fallos = resultados.where((r) => r == false).length;
    final total = preguntas.length;
    final nota = (aciertos / total) * 10;
    final aprobado = nota >= 5;

    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C),
        foregroundColor: Colors.white,
        title: const Text('Resultados'),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: aprobado ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Icon(
                    aprobado ? Icons.emoji_events : Icons.sentiment_dissatisfied,
                    size: 60,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    aprobado ? '¡APROBADO!' : 'SUSPENSO',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    nota.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 52, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    'sobre 10',
                    style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: Column(
                children: [
                  const Text(
                    'Distribución de respuestas',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CustomPaint(
                      painter: GraficoPastel(
                        aciertos: aciertos,
                        fallos: fallos,
                        total: total,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$aciertos/$total',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4A148C),
                              ),
                            ),
                            const Text('correctas', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Leyenda(color: Colors.green, texto: 'Correctas: $aciertos'),
                      const SizedBox(width: 20),
                      _Leyenda(color: Colors.red, texto: 'Incorrectas: $fallos'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Repaso de respuestas',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ...List.generate(preguntas.length, (i) {
                    final correcto = resultados[i] == true;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: correcto ? Colors.green[50] : Colors.red[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: correcto ? Colors.green[200]! : Colors.red[200]!,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            correcto ? Icons.check_circle : Icons.cancel,
                            color: correcto ? Colors.green : Colors.red,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '${i + 1}. ${preguntas[i].enunciado}',
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.home),
                label: const Text('Volver al inicio', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A148C),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _Leyenda extends StatelessWidget {
  final Color color;
  final String texto;
  const _Leyenda({required this.color, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 16, height: 16, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(texto, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}