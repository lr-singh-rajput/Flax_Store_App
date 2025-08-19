
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'utils/constants.dart';
//
// class AuthService {
//   // Method to login
//   Future<String> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('${Constants.apiBaseUrl}login'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({'email': email, 'password': password}),
//     );
//
//     if (response.statusCode == 200) {
//       // Assuming we get a token on successful login
//       var responseData = json.decode(response.body);
//       return responseData['token'];
//     } else {
//       throw Exception('Failed to login');
//     }
//   }
//
//   // Method to register new user
//   Future<String> signUp(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('${Constants.apiBaseUrl}signup'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({'email': email, 'password': password}),
//     );
//
//     if (response.statusCode == 201) {
//       var responseData = json.decode(response.body);
//       return responseData['token'];
//     } else {
//       throw Exception('Failed to sign up');
//     }
//   }
//
//   // Method to logout
//   Future<void> logout() async {
//     // Clear stored token or other logout tasks
//   }
// }