import 'package:dio/dio.dart';

class ApiServer {
  final String baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> get({required endpoint}) async {
    try {
      final response = await _dio.get('$baseUrl$endpoint');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
