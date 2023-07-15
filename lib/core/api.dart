import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String baseURL = "http://192.168.142.20:5000/api";
const Map<String, dynamic> defaultHeaders = {
  'Content-Type': 'application/json'
};

class Api {
  final Dio dio = Dio();

  Api() {
    dio.options.baseUrl = baseURL;
    dio.options.headers = defaultHeaders;
    dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
  }

  Dio get sendRequest => dio;
}

class ApiResponse {
  bool success;
  dynamic data;
  String? message;
  ApiResponse({required this.success, this.data, this.message});

  factory ApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponse(
        success: data["success"],
        data: data["data"],
        message: data["message"] ?? "Something goes wrong");
  }
}
