import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TestStorage {
  static Future<Map<String, dynamic>?> _loadJson(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(key);
    if (jsonStr == null) return null;
    return Map<String, dynamic>.from(jsonDecode(jsonStr));
  }

  static Future<void> _saveJson(String key, Map<String, dynamic> value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(value));
  }

  // Estado (resultado)
  static Future<Map<String, dynamic>?> loadTestState(String testId) async {
    return _loadJson('test_state_$testId');
  }

  static Future<void> saveTestState(String testId, Map<String, dynamic> estado) async {
    await _saveJson('test_state_$testId', estado);
  }

  // Selección fija
  static Future<List<String>?> loadTestSelection(String testId) async {
    final data = await _loadJson('test_sel_$testId');
    if (data == null) return null;
    final raw = data['qids'];
    if (raw is! List) return null;
    return raw.map((e) => e.toString()).toList();
  }

  static Future<void> saveTestSelection(String testId, List<String> qids) async {
    await _saveJson('test_sel_$testId', {'qids': qids});
  }
}