import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:5000';

  static Future<Map<String, dynamic>> registerStudent({
    required String name,
    required String email,
    required String phone,
    required String branch,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'phone': phone,
        'branch': branch,
      }),
    );
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  static Future<List<dynamic>> getBranches() async {
    final response = await http.get(Uri.parse('$baseUrl/branches'));
    return jsonDecode(response.body) as List<dynamic>;
  }

  static Future<Map<String, dynamic>> saveQuiz({
    required int studentId,
    required String subject,
    required int score,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/quiz'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'student_id': studentId,
        'subject': subject,
        'score': score,
      }),
    );
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
