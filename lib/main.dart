import 'package:flutter/material.dart';

import 'screens/pantalla_inicio.dart';

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
