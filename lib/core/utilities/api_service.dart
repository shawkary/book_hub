import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/volumes?';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> getData({required String path}) async {
    final response = await _dio.get('$_baseUrl$path');
    return response.data;
  }
}
