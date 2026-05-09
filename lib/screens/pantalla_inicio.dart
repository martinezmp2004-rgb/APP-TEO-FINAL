import 'package:flutter/material.dart';
import '../widgets/tarjeta_menu.dart';
import 'pantalla_test_temas.dart';
import 'pantalla_simulacro.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  const Icon(Icons.school, size: 72, color: Color(0xFF4A148C)),
                  const SizedBox(height: 16),
                  const Text(
                    'FINAL TEOLOGÍA',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A148C),
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Preparación para el examen',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TarjetaMenu(
                      icon: Icons.menu_book,
                      titulo: 'Test por Temas',
                      subtitulo: '30 tests de 10 preguntas por tema',
                      color: const Color(0xFF4A148C),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const PantallaTestTemas()),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TarjetaMenu(
                      icon: Icons.assignment,
                      titulo: 'Simulacro de Examen',
                      subtitulo: '100 simulacros de 20 preguntas mezcladas',
                      color: const Color(0xFF1B5E20),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const PantallaSimulacro()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}