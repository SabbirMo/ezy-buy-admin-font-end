import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthServices {
  final String baseUrl = "https://ezybuy-backend-l9n0.onrender.com/api/";

  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    final url = Uri.parse('$baseUrl/users/login');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Login Success $data");
      return data;
    } else {
      throw Exception('Login Failed: ${response.body}');
    }
  }
}
