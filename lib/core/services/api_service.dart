import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/endpoint.dart';
import 'package:stylclick/shared/models/api_model.dart';

/// Central base service.
/// All protected calls should use [authHeaders].
class ApiService {
  static ApiService? _instance;

  ApiService._();

  static ApiService get instance {
    _instance ??= ApiService._();
    return _instance!;
  }

  // ── Token helpers ─────────────────────────────────────────────────────

  static Map<String, String> get baseHeaders => {
        "Accept": "application/json",
      };

  static Map<String, String> get authHeaders {
    final token = getStringAsync("access_token");
    return {
      "Accept": "application/json",
      if (token.isNotEmpty) "Authorization": "Bearer $token",
    };
  }

  // ── Generic request helpers ───────────────────────────────────────────

  Future<ApiResponse<T>> post<T>(
    String path, {
    required Map<String, String> body,
    bool authenticated = false,
    T Function(dynamic)? transform,
  }) async {
    transform ??= (r) => r as T;
    final apiResponse = ApiResponse<T>();

    try {
      final url = baseUrl + path;
      log('[API] POST $url | body: $body');

      final res = await http.post(
        Uri.parse(url),
        headers: authenticated ? authHeaders : baseHeaders,
        body: body,
      );

      log('[API] Status: ${res.statusCode} | Body: ${res.body}');

      dynamic data;
      try {
        data = json.decode(res.body);
      } catch (_) {}

      if (res.statusCode >= 200 && res.statusCode < 300) {
        apiResponse.data = transform(data ?? res.body);
        apiResponse.status = true;
        apiResponse.message = data is Map && data.containsKey('message')
            ? data['message'].toString()
            : null;
      } else {
        apiResponse.status = false;
        apiResponse.message = _parseErrorMessage(data, res.statusCode);
      }
    } on SocketException {
      apiResponse.status = false;
      apiResponse.message = 'No internet connection. Please check your network.';
    } catch (e) {
      apiResponse.status = false;
      apiResponse.message = e.toString();
    }

    return apiResponse;
  }

  Future<ApiResponse<T>> get<T>(
    String path, {
    bool authenticated = true,
    T Function(dynamic)? transform,
  }) async {
    transform ??= (r) => r as T;
    final apiResponse = ApiResponse<T>();

    try {
      final url = baseUrl + path;
      log('[API] GET $url');

      final res = await http.get(
        Uri.parse(url),
        headers: authenticated ? authHeaders : baseHeaders,
      );

      log('[API] Status: ${res.statusCode} | Body: ${res.body}');

      dynamic data;
      try {
        data = json.decode(res.body);
      } catch (_) {}

      if (res.statusCode >= 200 && res.statusCode < 300) {
        apiResponse.data = transform(data ?? res.body);
        apiResponse.status = true;
      } else {
        apiResponse.status = false;
        apiResponse.message = _parseErrorMessage(data, res.statusCode);
      }
    } on SocketException {
      apiResponse.status = false;
      apiResponse.message = 'No internet connection. Please check your network.';
    } catch (e) {
      apiResponse.status = false;
      apiResponse.message = e.toString();
    }

    return apiResponse;
  }

  Future<ApiResponse<T>> patch<T>(
    String path, {
    required Map<String, String> body,
    bool authenticated = true,
    T Function(dynamic)? transform,
  }) async {
    transform ??= (r) => r as T;
    final apiResponse = ApiResponse<T>();

    try {
      final url = baseUrl + path;
      log('[API] PATCH $url | body: $body');

      final res = await http.patch(
        Uri.parse(url),
        headers: authenticated ? authHeaders : baseHeaders,
        body: body,
      );

      log('[API] Status: ${res.statusCode} | Body: ${res.body}');

      dynamic data;
      try {
        data = json.decode(res.body);
      } catch (_) {}

      if (res.statusCode >= 200 && res.statusCode < 300) {
        apiResponse.data = transform(data ?? res.body);
        apiResponse.status = true;
        apiResponse.message = data is Map && data.containsKey('message')
            ? data['message'].toString()
            : null;
      } else {
        apiResponse.status = false;
        apiResponse.message = _parseErrorMessage(data, res.statusCode);
      }
    } on SocketException {
      apiResponse.status = false;
      apiResponse.message = 'No internet connection. Please check your network.';
    } catch (e) {
      apiResponse.status = false;
      apiResponse.message = e.toString();
    }

    return apiResponse;
  }

  String _parseErrorMessage(dynamic data, int statusCode) {
    if (data is Map) {
      try {
        // 1. Check "error" key (which could be List, String, or Map)
        if (data.containsKey('error')) {
          final errorVal = data['error'];
          if (errorVal is List && errorVal.isNotEmpty) {
            return errorVal.map((e) => e.toString().replaceAll('"', '')).join(', ');
          }
          if (errorVal is String) {
            return errorVal.replaceAll('"', '');
          }
          if (errorVal is Map) {
            final errorMap = errorVal;
            if (errorMap.containsKey('response') && errorMap['response'] is Map) {
              final responseMap = errorMap['response'] as Map;
              if (responseMap.containsKey('body') && responseMap['body'] is Map) {
                final bodyMap = responseMap['body'] as Map;
                if (bodyMap.containsKey('errors') && bodyMap['errors'] is List) {
                  final errorsList = bodyMap['errors'] as List;
                  if (errorsList.isNotEmpty && errorsList[0] is Map) {
                    final firstError = errorsList[0] as Map;
                    if (firstError.containsKey('message')) {
                      final nestedMsg = firstError['message'].toString().replaceAll('"', '');
                      final mainMsg = data.containsKey('message') ? data['message'].toString().replaceAll('"', '') : '';
                      if (mainMsg.isNotEmpty && mainMsg != nestedMsg) {
                        return "$mainMsg: $nestedMsg";
                      }
                      return nestedMsg;
                    }
                  }
                }
              }
            }
            if (errorMap.containsKey('message')) {
              final errMessage = errorMap['message'].toString().replaceAll('"', '');
              final mainMsg = data.containsKey('message') ? data['message'].toString().replaceAll('"', '') : '';
              if (mainMsg.isNotEmpty && mainMsg != errMessage) {
                return "$mainMsg: $errMessage";
              }
              return errMessage;
            }
          }
        }

        // 2. Check "errors" key (which could be List, Map, or String)
        if (data.containsKey('errors')) {
          final errorsVal = data['errors'];
          if (errorsVal is List && errorsVal.isNotEmpty) {
            return errorsVal.map((e) => e.toString().replaceAll('"', '')).join(', ');
          }
          if (errorsVal is Map) {
            final List<String> messages = [];
            errorsVal.forEach((key, value) {
              if (value is List) {
                messages.add("$key: ${value.map((v) => v.toString().replaceAll('"', '')).join(', ')}");
              } else {
                messages.add("$key: ${value.toString().replaceAll('"', '')}");
              }
            });
            if (messages.isNotEmpty) {
              return messages.join('\n');
            }
          }
          if (errorsVal is String) {
            return errorsVal.replaceAll('"', '');
          }
        }
      } catch (e) {
        log('[API] Error parsing nested error: $e');
      }

      // 3. Fall back to standard "message" key
      if (data.containsKey('message')) {
        return data['message'].toString().replaceAll('"', '');
      }
    }
    return 'Request failed ($statusCode)';
  }
}
