import 'package:stylclick/core/services/api_service.dart';
import 'package:stylclick/shared/endpoint.dart';
import 'package:stylclick/shared/models/api_model.dart';

class AuthService {
  static AuthService? _authService;

  AuthService._();

  static AuthService get instance {
    _authService ??= AuthService._();
    return _authService!;
  }

  final _api = ApiService.instance;

  // ── Login ─────────────────────────────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> login(
    String email,
    String password,
  ) =>
      _api.post<Map<String, dynamic>>(
        signIn,
        body: {"email": email, "password": password},
        authenticated: false,
        transform: (r) => Map<String, dynamic>.from(r as Map),
      );

  // ── Register ──────────────────────────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String state,
    required String address,
    String? referralCode,
  }) =>
      _api.post<Map<String, dynamic>>(
        register,
        body: {
          "email": email,
          "password": password,
          "firstname": firstName,
          "lastname": lastName,
          "phone": phone,
          "state": state,
          "address": address,
          "origin": "mobile",
          if (referralCode != null && referralCode.isNotEmpty)
            "referral_code": referralCode,
        },
        authenticated: false,
        transform: (r) => Map<String, dynamic>.from(r as Map),
      );

  // ── Verify OTP ────────────────────────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> verify({
    required String email,
    required String token,
  }) =>
      _api.post<Map<String, dynamic>>(
        verifyUser,
        body: {"email": email, "token": token},
        authenticated: false,
        transform: (r) => Map<String, dynamic>.from(r as Map),
      );

  // ── Resend OTP ────────────────────────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> resendVerificationOtp({
    required String email,
  }) =>
      _api.post<Map<String, dynamic>>(
        resendOtp,
        body: {"email": email},
        authenticated: false,
        transform: (r) => Map<String, dynamic>.from(r as Map),
      );

  // ── Forgot Password (request reset link) ─────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> requestPasswordReset({
    required String email,
  }) =>
      _api.patch<Map<String, dynamic>>(
        resetRequest,
        body: {"email": email},
        authenticated: false,
        transform: (r) => Map<String, dynamic>.from(r as Map),
      );

  // ── Reset Password ────────────────────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> resetPassword({
    required String email,
    required String token,
    required String newPassword,
  }) =>
      _api.patch<Map<String, dynamic>>(
        changePassword,
        body: {
          "email": email,
          "token": token,
          "password": newPassword,
          "password_confirmation": newPassword,
        },
        authenticated: false,
        transform: (r) => Map<String, dynamic>.from(r as Map),
      );
}
