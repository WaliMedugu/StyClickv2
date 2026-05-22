import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/endpoint.dart';
import 'package:stylclick/shared/models/api_model.dart';

class AuthService {
  static AuthService? _authService;

  AuthService._();

  static AuthService? get instance {
    _authService ??= AuthService._();
    return _authService;
  }

  Future<ApiResponse<T>> login<T>(
    String email,
    String password, {
    T Function(dynamic)? transform,
  }) async {
    transform ??= (dynamic r) => r as T;

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      final url = baseUrl + signIn;
      log('[API REQ] POST $url');
      Response res = await post(
          Uri.parse(url),
          headers: {
            "Accept": "application/json",
          },
          body: {
            "email": email,
            "password": password
          });

      log('[API RESP] Status: ${res.statusCode}');
      log('[API RESP] Body: ${res.body}');

      dynamic data;
      try {
        data = json.decode(res.body);
      } catch (e) {
        log('[API ERR] Failed to parse response JSON: $e');
      }

      if (res.statusCode.isSuccessful()) {
        apiResponse.data = transform(data ?? res.body);
        apiResponse.status = true;
      } else {
        apiResponse.status = false;
        apiResponse.message = data != null && data is Map && data.containsKey('message')
            ? data['message'].toString()
            : 'Error occurred (Status: ${res.statusCode}, Body: ${res.body})';
      }
    } on SocketException catch (e) {
      log('[API ERR] SocketException: ${e.toString()}');
      apiResponse.status = false;
      apiResponse.message = e.toString();
    } catch (e) {
      log('[API ERR] Exception: ${e.toString()}');
      apiResponse.status = false;
      apiResponse.message = e.toString();
    }

    return apiResponse;
  }

  Future<ApiResponse<T>> signup<T>({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String state,
    required String address,
    T Function(dynamic)? transform,
  }) async {
    transform ??= (dynamic r) => r as T;

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      final url = baseUrl + register;
      log('[API REQ] POST $url');
      Response res = await post(
          Uri.parse(url),
          headers: {
            "Accept": "application/json",
          },
          body: {
            "email": email,
            "password": password,
            "firstname": firstName,
            "lastname": lastName,
            "phone": phone,
            "state": state,
            "address": address,
            "origin": "mobile"
          });

      log('[API RESP] Status: ${res.statusCode}');
      log('[API RESP] Body: ${res.body}');

      dynamic data;
      try {
        data = json.decode(res.body);
      } catch (e) {
        log('[API ERR] Failed to parse response JSON: $e');
      }

      if (res.statusCode.isSuccessful()) {
        apiResponse.data = transform(data ?? res.body);
        apiResponse.status = true;
      } else {
        apiResponse.status = false;
        apiResponse.message = data != null && data is Map && data.containsKey('message')
            ? data['message'].toString()
            : 'Error occurred (Status: ${res.statusCode}, Body: ${res.body})';
      }
    } on SocketException catch (e) {
      log('[API ERR] SocketException: ${e.toString()}');
      apiResponse.status = false;
      apiResponse.message = e.toString();
    } catch (e) {
      log('[API ERR] Exception: ${e.toString()}');
      apiResponse.status = false;
      apiResponse.message = e.toString();
    }

    return apiResponse;
  }

  Future<ApiResponse<T>> verify<T>({
    required String email,
    required String token,
    T Function(dynamic)? transform,
  }) async {
    transform ??= (dynamic r) => r as T;

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      final url = baseUrl + verifyUser;
      log('[API REQ] POST $url');
      Response res = await post(
          Uri.parse(url),
          headers: {
            "Accept": "application/json",
          },
          body: {
            "email": email,
            "token": token
          });

      log('[API RESP] Status: ${res.statusCode}');
      log('[API RESP] Body: ${res.body}');

      dynamic data;
      try {
        data = json.decode(res.body);
      } catch (e) {
        log('[API ERR] Failed to parse response JSON: $e');
      }

      if (res.statusCode.isSuccessful()) {
        apiResponse.data = transform(data ?? res.body);
        apiResponse.status = true;
      } else {
        apiResponse.status = false;
        apiResponse.message = data != null && data is Map && data.containsKey('message')
            ? data['message'].toString()
            : 'Error occurred (Status: ${res.statusCode}, Body: ${res.body})';
      }
    } on SocketException catch (e) {
      log('[API ERR] SocketException: ${e.toString()}');
      apiResponse.status = false;
      apiResponse.message = e.toString();
    } catch (e) {
      log('[API ERR] Exception: ${e.toString()}');
      apiResponse.status = false;
      apiResponse.message = e.toString();
    }

    return apiResponse;
  }
}
