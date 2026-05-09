import 'package:flutter/material.dart';

void main() {
  runApp(const FilosofiaApp());
}

class FilosofiaApp extends StatelessWidget {
  const FilosofiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FINAL_TEO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A148C),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const PantallaInicio(),
    );
  }
}

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C),
        foregroundColor: Colors.white,
        title: const Text('FINAL_TEO'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.school, size: 72, color: Color(0xFF4A148C)),
              const SizedBox(height: 16),
              const Text(
                'App cargada correctamente',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Siguiente paso: añadimos pantallas y preguntas.',
                style: TextStyle(color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}