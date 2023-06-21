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
    transform ??= (dynamic r) => r.body as T;

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      Response res = await post(
          Uri.parse(
            baseUrl + signIn,
          ),
          headers: {
            "Accept": "application/json",
          },
          body: {
            "email": email,
            "password": password
          });

      final dynamic data = json.decode(res.body);

      if (res.statusCode.isSuccessful()) {
        log(data);
        apiResponse.data = transform(data);
        apiResponse.status = true;
      } else {
        apiResponse.status = false;
        apiResponse.message = (data['message'] ?? 'Error occurred');
      }
    } on SocketException catch (e) {
      log('here is the exception ${e.toString()}');
      apiResponse.status = false;
      apiResponse.message = (e).toString();
    } catch (e) {
      log(e.toString());

      apiResponse.status = false;
      apiResponse.message = 'Unable to process request at the moment';
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
    transform ??= (dynamic r) => r.body as T;

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      Response res = await post(
          Uri.parse(
            baseUrl + register,
          ),
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

      final dynamic data = json.decode(res.body);

      if (res.statusCode.isSuccessful()) {
        log(data);
        apiResponse.data = transform(data);
        apiResponse.status = true;
      } else {
        apiResponse.status = false;
        apiResponse.message = (data['message'] ?? 'Error occurred');
      }
    } on SocketException catch (e) {
      log('here is the exception ${e.toString()}');
      apiResponse.status = false;
      apiResponse.message = (e).toString();
    } catch (e) {
      log(e.toString());

      apiResponse.status = false;
      apiResponse.message = 'Unable to process request at the moment';
    }

    return apiResponse;
  }

  Future<ApiResponse<T>> verify<T>({
    required String email,
    required String token,
    T Function(dynamic)? transform,
  }) async {
    transform ??= (dynamic r) => r.body as T;

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      Response res = await post(
          Uri.parse(
            baseUrl + verifyUser,
          ),
          headers: {
            "Accept": "application/json",
          },
          body: {
            "email": email,
            "token": token
          });

      final dynamic data = json.decode(res.body);

      if (res.statusCode.isSuccessful()) {
        log(data);
        apiResponse.data = transform(data);
        apiResponse.status = true;
      } else {
        apiResponse.status = false;
        apiResponse.message = (data['message'] ?? 'Error occurred');
      }
    } on SocketException catch (e) {
      log('here is the exception ${e.toString()}');
      apiResponse.status = false;
      apiResponse.message = (e).toString();
    } catch (e) {
      log(e.toString());

      apiResponse.status = false;
      apiResponse.message = 'Unable to process request at the moment';
    }

    return apiResponse;
  }
}
