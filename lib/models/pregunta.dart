import 'dart:convert';

class Pregunta {
  final String id;
  final String enunciado;
  final List<String> opciones;
  final int correcta; // 0-3
  final String explicacion;

  Pregunta({
    String? id,
    required this.enunciado,
    required this.opciones,
    required this.correcta,
    required this.explicacion,
  }) : id = id ?? _stableId(enunciado, opciones, correcta, explicacion);

  static String _stableId(String enunciado, List<String> opciones, int correcta, String explicacion) {
    final raw = '$enunciado||${opciones.join("||")}||$correcta||$explicacion';
    int hash = 0;
    for (final unit in utf8.encode(raw)) {
      hash = (hash * 31 + unit) & 0x7fffffff;
    }
    return 'q_$hash';
  }
}