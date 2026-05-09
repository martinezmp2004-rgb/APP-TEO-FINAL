import 'package:flutter/material.dart';
import '../models/pregunta.dart';
import '../services/test_storage.dart';
import 'pantalla_resultados.dart';

class PantallaTest extends StatefulWidget {
  final List<Pregunta> preguntas;
  final String titulo;
  final String testId;

  const PantallaTest({
    super.key,
    required this.preguntas,
    required this.titulo,
    required this.testId,
  });

  @override
  State<PantallaTest> createState() => _PantallaTestState();
}

class _PantallaTestState extends State<PantallaTest> {
  int indiceActual = 0;
  int? seleccion;
  bool respondida = false;
  late List<bool?> resultados;
  bool terminado = false;

  @override
  void initState() {
    super.initState();
    resultados = List.filled(widget.preguntas.length, null);
  }

  void responder(int opcion) {
    if (respondida) return;
    setState(() {
      seleccion = opcion;
      respondida = true;
      resultados[indiceActual] = opcion == widget.preguntas[indiceActual].correcta;
    });
  }

  void siguiente() {
    if (indiceActual < widget.preguntas.length - 1) {
      setState(() {
        indiceActual++;
        seleccion = null;
        respondida = false;
      });
    } else {
      _finalizarTest();
    }
  }

  Future<void> _finalizarTest() async {
    final aciertos = resultados.where((r) => r == true).length;
    final nota = (aciertos / widget.preguntas.length) * 10;

    await TestStorage.saveTestState(widget.testId, {
      'completado': true,
      'aciertos': aciertos,
      'total': widget.preguntas.length,
      'nota': nota,
      'ts': DateTime.now().toIso8601String(),
    });

    if (!mounted) return;
    setState(() => terminado = true);
  }

  @override
  Widget build(BuildContext context) {
    if (terminado) {
      return PantallaResultados(
        titulo: widget.titulo,
        resultados: resultados,
        preguntas: widget.preguntas,
      );
    }

    final pregunta = widget.preguntas[indiceActual];
    final total = widget.preguntas.length;
    final letras = ['A', 'B', 'C', 'D'];

    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C),
        foregroundColor: Colors.white,
        title: Text(widget.titulo, style: const TextStyle(fontSize: 15)),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: LinearProgressIndicator(
            value: (indiceActual + 1) / total,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contador
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pregunta ${indiceActual + 1} de $total',
                  style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
                ),
                Row(
                  children: List.generate(total, (i) {
                    Color c = Colors.grey[300]!;
                    if (i < indiceActual) {
                      c = resultados[i] == true ? Colors.green : Colors.red;
                    } else if (i == indiceActual) {
                      c = const Color(0xFF4A148C);
                    }
                    return Container(
                      margin: const EdgeInsets.only(left: 3),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(color: c, shape: BoxShape.circle),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Enunciado
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: Text(
                pregunta.enunciado,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, height: 1.5),
              ),
            ),
            const SizedBox(height: 20),

            // Opciones
            ...List.generate(pregunta.opciones.length, (i) {
              Color bgColor = Colors.white;
              Color borderColor = Colors.grey[300]!;
              Color textColor = Colors.black87;
              IconData? icono;

              if (respondida) {
                if (i == pregunta.correcta) {
                  bgColor = Colors.green[50]!;
                  borderColor = Colors.green;
                  textColor = Colors.green[900]!;
                  icono = Icons.check_circle;
                } else if (i == seleccion && i != pregunta.correcta) {
                  bgColor = Colors.red[50]!;
                  borderColor = Colors.red;
                  textColor = Colors.red[900]!;
                  icono = Icons.cancel;
                }
              } else if (seleccion == i) {
                bgColor = const Color(0xFFEDE7F6);
                borderColor = const Color(0xFF4A148C);
              }

              return GestureDetector(
                onTap: () => responder(i),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: borderColor, width: 2),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: borderColor.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            letras[i],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: borderColor == Colors.grey[300] ? Colors.grey[600] : borderColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          pregunta.opciones[i],
                          style: TextStyle(fontSize: 15, color: textColor, height: 1.4),
                        ),
                      ),
                      if (icono != null) Icon(icono, color: borderColor, size: 24),
                    ],
                  ),
                ),
              );
            }),

            // Explicación + botón
            if (respondida) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber[700]!, width: 1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.lightbulb, color: Colors.amber[800], size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'NOTA',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.amber[900],
                            fontSize: 13,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      pregunta.explicacion,
                      style: TextStyle(fontSize: 14, color: Colors.brown[800], height: 1.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: siguiente,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A148C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    indiceActual < widget.preguntas.length - 1 ? 'Siguiente pregunta →' : 'Ver resultados',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}