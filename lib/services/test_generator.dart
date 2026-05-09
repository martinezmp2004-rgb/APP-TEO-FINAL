import 'dart:math';
import '../models/pregunta.dart';
import 'test_storage.dart';

class TestGenerator {
  static Future<List<Pregunta>> fixedQuestionsForTest({
    required String testId,
    required List<Pregunta> pool,
    required int cantidad,
    int? seed,
  }) async {
    final savedIds = await TestStorage.loadTestSelection(testId);

    // Mapa id->pregunta
    final map = {for (final q in pool) q.id: q};

    if (savedIds != null && savedIds.isNotEmpty) {
      final preguntas = <Pregunta>[];
      for (final id in savedIds) {
        final q = map[id];
        if (q != null) preguntas.add(q);
      }

      // Si faltan por cambios en el banco, rellenamos y re-guardamos
      if (preguntas.length < cantidad) {
        final restantes = pool.where((q) => !preguntas.any((p) => p.id == q.id)).toList();
        final rng = Random(seed ?? testId.hashCode);
        restantes.shuffle(rng);
        preguntas.addAll(restantes.take(cantidad - preguntas.length));
        await TestStorage.saveTestSelection(testId, preguntas.map((e) => e.id).toList());
      }

      return preguntas.take(cantidad).toList();
    }

    final rng = Random(seed ?? testId.hashCode);
    final mezcladas = List<Pregunta>.from(pool)..shuffle(rng);
    final elegidas = mezcladas.take(min(cantidad, mezcladas.length)).toList();
    await TestStorage.saveTestSelection(testId, elegidas.map((e) => e.id).toList());
    return elegidas;
  }
}