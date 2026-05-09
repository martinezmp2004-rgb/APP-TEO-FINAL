import '../models/pregunta.dart';

const List<Map<String, dynamic>> temas = [
  {'nombre': 'Tema 1: Introducción / Teología Natural', 'id': 1},
  {'nombre': 'Tema 2: La Analogía del Ente', 'id': 2},
  {'nombre': 'Tema 3: El Teísmo (Vías filosóficas)', 'id': 3},
  {'nombre': 'Tema 4: El Ateísmo', 'id': 4},
  {'nombre': 'Tema 5: El Agnosticismo', 'id': 5},
];

// ─────────────────────────────────────────────
// BANCO DE PREGUNTAS
// Pega aquí tus listas completas.
// ─────────────────────────────────────────────

final List<Pregunta> preguntasTema1 = [
  // TODO: pega aquí las preguntas del tema 1
];

final List<Pregunta> preguntasTema2 = [
  // TODO: pega aquí las preguntas del tema 2
];

final List<Pregunta> preguntasTema3 = [
  // TODO: pega aquí las preguntas del tema 3
];

final List<Pregunta> preguntasTema4 = [
  // TODO: pega aquí las preguntas del tema 4
];

final List<Pregunta> preguntasTema5 = [
  // TODO: pega aquí las preguntas del tema 5
];

List<Pregunta> getPreguntasTema(int id) {
  switch (id) {
    case 1:
      return preguntasTema1;
    case 2:
      return preguntasTema2;
    case 3:
      return preguntasTema3;
    case 4:
      return preguntasTema4;
    case 5:
      return preguntasTema5;
    default:
      return [];
  }
}

List<Pregunta> todasLasPreguntas() => [
      ...preguntasTema1,
      ...preguntasTema2,
      ...preguntasTema3,
      ...preguntasTema4,
      ...preguntasTema5,
    ];