import 'package:stylclick/core/services/api_service.dart';
import 'package:stylclick/shared/endpoint.dart';
import 'package:stylclick/shared/models/api_model.dart';

class WalletService {
  static WalletService? _instance;
  WalletService._();
  static WalletService get instance {
    _instance ??= WalletService._();
    return _instance!;
  }

  final _api = ApiService.instance;

  // ── Balance ───────────────────────────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> getBalance() =>
      _api.get<Map<String, dynamic>>(
        walletBalance,
        transform: (r) => Map<String, dynamic>.from(r as Map),
      );

  // ── Transactions ──────────────────────────────────────────────────────

  Future<ApiResponse<List<dynamic>>> getTransactions() =>
      _api.get<List<dynamic>>(
        walletTransactions,
        transform: (r) {
          if (r is Map && r.containsKey('data')) return List<dynamic>.from(r['data']);
          if (r is List) return List<dynamic>.from(r);
          return [];
        },
      );

  // ── Fund Wallet ───────────────────────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> fundWallet({
    required String amount,
    required String method, // 'card' | 'transfer' | 'ussd'
  }) =>
      _api.post<Map<String, dynamic>>(
        walletFund,
        body: {"amount": amount, "payment_method": method},
        authenticated: true,
        transform: (r) => Map<String, dynamic>.from(r as Map),
      );

  // ── Withdrawal ────────────────────────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> requestWithdrawal({
    required String amount,
    required String bank,
    required String accountNumber,
    required String accountName,
  }) =>
      _api.post<Map<String, dynamic>>(
        walletWithdraw,
        body: {
          "amount": amount,
          "bank": bank,
          "account_number": accountNumber,
          "account_name": accountName,
        },
        authenticated: true,
        transform: (r) => Map<String, dynamic>.from(r as Map),
      );
}
