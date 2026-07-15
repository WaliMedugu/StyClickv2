import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const String base = 'https://styclick-backend.onrender.com/api/v1/';

// Dynamic email timestamp to ensure a fresh signup attempt
final String ts = DateTime.now().millisecondsSinceEpoch.toString();
late final String testEmail = 'testuser_$ts@mailinator.com';
const String testPassword = 'Test@12345';
const String testFirstName = 'Test';
const String testLastName  = 'User';
const String testPhone     = '+2348012345678';
const String testState     = 'Lagos';
const String testAddress   = '12 Test Street, Lagos';

String _token = ''; // Filled dynamically during login/verify if available

class TestResult {
  final String screen;
  final String endpoint;
  final String method;
  final String payload;
  final int statusCode;
  final String response;
  final String passFail;
  final String log;

  TestResult({
    required this.screen,
    required this.endpoint,
    required this.method,
    required this.payload,
    required this.statusCode,
    required this.response,
    required this.passFail,
    required this.log,
  });
}

final List<TestResult> results = [];

void main() async {
  print('=========================================');
  print('Starting integration tests...');
  print('Test Email: $testEmail');
  print('=========================================');

  // 1. Signup
  print('-> Running: POST auth/signup');
  await _runTest(
    screen: 'Register',
    endpoint: 'auth/signup',
    method: 'POST',
    payload: 'email: $testEmail, password: $testPassword, firstname: $testFirstName, lastname: $testLastName, phone: $testPhone, state: $testState, address: $testAddress, origin: mobile',
    action: () => http.post(
      Uri.parse('${base}auth/signup'),
      headers: {'Accept': 'application/json'},
      body: {
        'email': testEmail,
        'password': testPassword,
        'firstname': testFirstName,
        'lastname': testLastName,
        'phone': testPhone,
        'state': testState,
        'address': testAddress,
        'origin': 'mobile',
      },
    ).timeout(const Duration(seconds: 60)),
    isPass: (res) => res.statusCode == 201 || res.statusCode == 200,
  );

  // 2. Verify OTP
  print('-> Running: POST auth/verify');
  await _runTest(
    screen: 'Verify OTP',
    endpoint: 'auth/verify',
    method: 'POST',
    payload: 'email: $testEmail, token: 1234',
    action: () => http.post(
      Uri.parse('${base}auth/verify'),
      headers: {'Accept': 'application/json'},
      body: {
        'email': testEmail,
        'token': '1234',
      },
    ).timeout(const Duration(seconds: 30)),
    isPass: (res) => res.statusCode == 200,
    failureExpected: true,
  );

  // 3. Resend OTP (Skipped as requested)
  print('-> Skipped: POST auth/resend-otp');
  results.add(TestResult(
    screen: 'Verify OTP (Resend)',
    endpoint: 'auth/resend-otp',
    method: 'POST',
    payload: 'N/A',
    statusCode: 0,
    response: 'Skipped (Not implemented/skipped in test)',
    passFail: 'Skipped',
    log: 'Skipped in test configuration',
  ));

  // 4. Login
  print('-> Running: POST auth/login');
  await _runTest(
    screen: 'Login',
    endpoint: 'auth/login',
    method: 'POST',
    payload: 'email: $testEmail, password: $testPassword',
    action: () => http.post(
      Uri.parse('${base}auth/login'),
      headers: {'Accept': 'application/json'},
      body: {
        'email': testEmail,
        'password': testPassword,
      },
    ).timeout(const Duration(seconds: 30)),
    isPass: (res) => res.statusCode == 200,
    failureExpected: true,
    onResult: (body) {
      try {
        final data = json.decode(body);
        final tok = data['token'] ?? data['access_token'] ?? data['data']?['token'];
        if (tok != null) {
          _token = tok.toString();
        }
      } catch (_) {}
    },
  );

  // 5. Password Reset Request
  print('-> Running: PATCH auth/password-reset-request');
  await _runTest(
    screen: 'Forgot Password',
    endpoint: 'auth/password-reset-request',
    method: 'PATCH',
    payload: 'email: $testEmail',
    action: () => http.patch(
      Uri.parse('${base}auth/password-reset-request'),
      headers: {'Accept': 'application/json'},
      body: {
        'email': testEmail,
      },
    ).timeout(const Duration(seconds: 60)),
    isPass: (res) => res.statusCode == 200 || res.statusCode == 201,
  );

  // 6. Reset Password
  print('-> Running: PATCH auth/reset-password');
  await _runTest(
    screen: 'Reset Password',
    endpoint: 'auth/reset-password',
    method: 'PATCH',
    payload: 'email: $testEmail, token: 999999, password: NewTest@12345, password_confirmation: NewTest@12345',
    action: () => http.patch(
      Uri.parse('${base}auth/reset-password'),
      headers: {'Accept': 'application/json'},
      body: {
        'email': testEmail,
        'token': '999999',
        'password': 'NewTest@12345',
        'password_confirmation': 'NewTest@12345',
      },
    ).timeout(const Duration(seconds: 20)),
    isPass: (res) => res.statusCode == 200,
    failureExpected: true,
  );

  // 7. Get Profile
  print('-> Running: GET user/profile');
  await _runTest(
    screen: 'Profile View',
    endpoint: 'user/profile',
    method: 'GET',
    payload: 'N/A',
    action: () => http.get(
      Uri.parse('${base}user/profile'),
      headers: {
        'Accept': 'application/json',
        if (_token.isNotEmpty) 'Authorization': 'Bearer $_token',
      },
    ).timeout(const Duration(seconds: 20)),
    isPass: (res) => res.statusCode == 200,
    failureExpected: _token.isEmpty,
  );

  // 8. Update Profile
  print('-> Running: PATCH user/update-profile');
  await _runTest(
    screen: 'Edit Profile',
    endpoint: 'user/update-profile',
    method: 'PATCH',
    payload: 'full_name: Test User, address: 12 Test Street, city: Ikeja, state: Lagos, country: Nigeria',
    action: () => http.patch(
      Uri.parse('${base}user/update-profile'),
      headers: {
        'Accept': 'application/json',
        if (_token.isNotEmpty) 'Authorization': 'Bearer $_token',
      },
      body: {
        'full_name': 'Test User',
        'address': '12 Test Street',
        'city': 'Ikeja',
        'state': 'Lagos',
        'country': 'Nigeria',
      },
    ).timeout(const Duration(seconds: 20)),
    isPass: (res) => res.statusCode == 200,
    failureExpected: _token.isEmpty,
  );

  // 9. Wallet Balance
  print('-> Running: GET wallet/dashboard');
  await _runTest(
    screen: 'Wallet Dashboard',
    endpoint: 'wallet/dashboard',
    method: 'GET',
    payload: 'N/A',
    action: () => http.get(
      Uri.parse('${base}wallet/dashboard'),
      headers: {
        'Accept': 'application/json',
        if (_token.isNotEmpty) 'Authorization': 'Bearer $_token',
      },
    ).timeout(const Duration(seconds: 20)),
    isPass: (res) => res.statusCode == 200,
    failureExpected: _token.isEmpty,
  );

  // 10. Wallet Transactions
  print('-> Running: GET wallet/transactions');
  await _runTest(
    screen: 'Transaction History',
    endpoint: 'wallet/transactions',
    method: 'GET',
    payload: 'N/A',
    action: () => http.get(
      Uri.parse('${base}wallet/transactions'),
      headers: {
        'Accept': 'application/json',
        if (_token.isNotEmpty) 'Authorization': 'Bearer $_token',
      },
    ).timeout(const Duration(seconds: 20)),
    isPass: (res) => res.statusCode == 200,
    failureExpected: _token.isEmpty,
  );

  // 11. Add Funds
  print('-> Running: POST wallet/add-fund');
  await _runTest(
    screen: 'Add Funds',
    endpoint: 'wallet/add-fund',
    method: 'POST',
    payload: 'amount: 5000, payment_method: card',
    action: () => http.post(
      Uri.parse('${base}wallet/add-fund'),
      headers: {
        'Accept': 'application/json',
        if (_token.isNotEmpty) 'Authorization': 'Bearer $_token',
      },
      body: {
        'amount': '5000',
        'payment_method': 'card',
      },
    ).timeout(const Duration(seconds: 20)),
    isPass: (res) => res.statusCode == 200 || res.statusCode == 201,
    failureExpected: _token.isEmpty,
  );

  // 12. Withdraw (Skipped as requested)
  print('-> Skipped: POST wallet/withdraw');
  results.add(TestResult(
    screen: 'Request Withdrawal',
    endpoint: 'wallet/withdraw',
    method: 'POST',
    payload: 'N/A',
    statusCode: 0,
    response: 'Skipped (Not implemented/skipped in test)',
    passFail: 'Skipped',
    log: 'Skipped in test configuration',
  ));

  // 13. Become Vendor / Designer
  print('-> Running: POST user/designer/register');
  await _runTest(
    screen: 'Become Vendor',
    endpoint: 'user/designer/register',
    method: 'POST',
    payload: 'shop_name: Test Designs, email: vendor@test.com, phone: +2348012345678, address: 1 Fashion Lane, Lagos, specializations: Traditional,Bridal, years_of_experience: 3, type: designer',
    action: () => http.post(
      Uri.parse('${base}user/designer/register'),
      headers: {
        'Accept': 'application/json',
        if (_token.isNotEmpty) 'Authorization': 'Bearer $_token',
      },
      body: {
        'shop_name': 'Test Designs',
        'email': 'vendor@test.com',
        'phone': '+2348012345678',
        'address': '1 Fashion Lane, Lagos',
        'specializations': 'Traditional,Bridal',
        'years_of_experience': '3',
        'type': 'designer',
      },
    ).timeout(const Duration(seconds: 20)),
    isPass: (res) => res.statusCode == 200 || res.statusCode == 201,
    failureExpected: _token.isEmpty,
  );

  // 14. Become Seller
  print('-> Running: POST user/fabric-seller/register');
  await _runTest(
    screen: 'Become Seller',
    endpoint: 'user/fabric-seller/register',
    method: 'POST',
    payload: 'shop_name: Test Fabrics, email: seller@test.com, phone: +2348012345678, address: 2 Fabric Row, Lagos, fabric_types: Ankara,Lace, type: seller',
    action: () => http.post(
      Uri.parse('${base}user/fabric-seller/register'),
      headers: {
        'Accept': 'application/json',
        if (_token.isNotEmpty) 'Authorization': 'Bearer $_token',
      },
      body: {
        'shop_name': 'Test Fabrics',
        'email': 'seller@test.com',
        'phone': '+2348012345678',
        'address': '2 Fabric Row, Lagos',
        'fabric_types': 'Ankara,Lace',
        'type': 'seller',
      },
    ).timeout(const Duration(seconds: 20)),
    isPass: (res) => res.statusCode == 200 || res.statusCode == 201,
    failureExpected: _token.isEmpty,
  );

  // 15. Become Rider
  print('-> Running: POST user/riders/register');
  await _runTest(
    screen: 'Become Rider',
    endpoint: 'user/riders/register',
    method: 'POST',
    payload: 'full_name: Test Rider, email: rider@test.com, phone: +2348012345678, address: 3 Delivery Ave, Lagos, vehicle_type: Motorcycle, vehicle_make: Honda, plate_number: LND-123AB, type: rider',
    action: () => http.post(
      Uri.parse('${base}user/riders/register'),
      headers: {
        'Accept': 'application/json',
        if (_token.isNotEmpty) 'Authorization': 'Bearer $_token',
      },
      body: {
        'full_name': 'Test Rider',
        'email': 'rider@test.com',
        'phone': '+2348012345678',
        'address': '3 Delivery Ave, Lagos',
        'vehicle_type': 'Motorcycle',
        'vehicle_make': 'Honda',
        'plate_number': 'LND-123AB',
        'type': 'rider',
      },
    ).timeout(const Duration(seconds: 20)),
    isPass: (res) => res.statusCode == 200 || res.statusCode == 201,
    failureExpected: _token.isEmpty,
  );

  // Print results in markdown format
  _printMarkdownTable();
}

Future<void> _runTest({
  required String screen,
  required String endpoint,
  required String method,
  required String payload,
  required Future<http.Response> Function() action,
  required bool Function(http.Response) isPass,
  bool failureExpected = false,
  void Function(String)? onResult,
}) async {
  try {
    final res = await action();
    final bool pass = isPass(res);
    final String cleanResponse = _cleanResponseBody(res.body);

    if (onResult != null) {
      onResult(res.body);
    }

    String passFailStatus = '';
    if (failureExpected) {
      passFailStatus = pass ? 'Pass' : 'Fail (Expected behaviour / Auth locked)';
    } else {
      passFailStatus = pass ? 'Pass' : 'Fail';
    }

    results.add(TestResult(
      screen: screen,
      endpoint: endpoint,
      method: method,
      payload: payload,
      statusCode: res.statusCode,
      response: cleanResponse,
      passFail: passFailStatus,
      log: 'HTTP Status Code: ${res.statusCode} | Response: ${res.body}',
    ));
    print('   Done: ${res.statusCode}');
  } catch (e) {
    results.add(TestResult(
      screen: screen,
      endpoint: endpoint,
      method: method,
      payload: payload,
      statusCode: 500,
      response: e.toString(),
      passFail: 'Fail (Exception)',
      log: e.toString(),
    ));
    print('   Error: $e');
  }
}

String _cleanResponseBody(String body) {
  try {
    final parsed = json.decode(body);
    if (parsed is Map) {
      final status = parsed['status'];
      final message = parsed['message'];
      return 'status: $status, message: $message';
    }
    return body.substring(0, body.length > 80 ? 80 : body.length);
  } catch (_) {
    return body.substring(0, body.length > 80 ? 80 : body.length);
  }
}

void _printMarkdownTable() {
  print('\n\n--- MARKDOWN TABLE OUTPUT ---');
  print('Screen | Endpoint | Method | Payload | Status Code | Response | Pass/Fail | Log');
  print('--- | --- | --- | --- | --- | --- | --- | ---');
  for (final r in results) {
    final String logCol = r.passFail.contains('Fail') ? '`' + r.log.replaceAll('\n', ' ').replaceAll('|', '\\|') + '`' : 'N/A';
    print('${r.screen} | `${r.endpoint}` | ${r.method} | `${r.payload}` | ${r.statusCode} | `${r.response}` | ${r.passFail} | $logCol');
  }
  print('-----------------------------\n');
}
