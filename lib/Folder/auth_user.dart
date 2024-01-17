import 'dart:convert';

import 'auth_repo.dart';
import 'package:http/http.dart' as http;


class AuthenticateUser {
  final authenticateRepository = AuthenticateRepository();

  Future<Map<String, dynamic>> login(
      String username,
      String password,
      String deviceId,
      String deviceName,
      ) async {
    final Map<String, dynamic> loginData = {
      'username': username,
      'password': password,
      'deviceId': deviceId,
      'deviceName': deviceName,
      'module': 'nisismobile',
    };

    final Uri apiUrl = Uri.parse('https://testportal.dsd.gov.za/msintake/api/Login/Mobile/');

    try {
      final response = await http.post(
        apiUrl,
        body: json.encode(loginData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Login successful, handle the response data here
        Map<String, dynamic> responseData = json.decode(response.body);
        // You can return this data or handle it accordingly
        return responseData;
      } else {
        // Handle other HTTP status codes
        print('HTTP Error: ${response.statusCode}');
        print('Response Body: ${response.body}');
        throw Exception(response.body);
      }
    } catch (e) {
      // Handle network errors or exceptions
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }
}