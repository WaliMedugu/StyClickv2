import 'package:stylclick/core/services/api_service.dart';
import 'package:stylclick/shared/endpoint.dart';
import 'package:stylclick/shared/models/api_model.dart';

class VendorService {
  static VendorService? _instance;
  VendorService._();
  static VendorService get instance {
    _instance ??= VendorService._();
    return _instance!;
  }

  final _api = ApiService.instance;

  // ── Become a Vendor / Designer ────────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> applyAsVendor({
    required String shopName,
    required String email,
    required String phone,
    required String address,
    required List<String> specializations,
    required String yearsOfExperience,
  }) =>
      _api.post<Map<String, dynamic>>(
        becomeVendor,
        body: {
          "shop_name": shopName,
          "email": email,
          "phone": phone,
          "address": address,
          "specializations": specializations.join(','),
          "years_of_experience": yearsOfExperience,
          "type": "designer",
        },
        authenticated: true,
        transform: (r) => Map<String, dynamic>.from(r as Map),
      );

  // ── Become a Seller (Fabric Store) ────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> applyAsSeller({
    required String shopName,
    required String email,
    required String phone,
    required String address,
    required List<String> fabricTypes,
  }) =>
      _api.post<Map<String, dynamic>>(
        becomeSeller,
        body: {
          "shop_name": shopName,
          "email": email,
          "phone": phone,
          "address": address,
          "fabric_types": fabricTypes.join(','),
          "type": "seller",
        },
        authenticated: true,
        transform: (r) => Map<String, dynamic>.from(r as Map),
      );

  // ── Become a Rider ────────────────────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> applyAsRider({
    required String fullName,
    required String email,
    required String phone,
    required String address,
    required String vehicleType,
    required String vehicleMake,
    required String plateNumber,
  }) =>
      _api.post<Map<String, dynamic>>(
        becomeRider,
        body: {
          "full_name": fullName,
          "email": email,
          "phone": phone,
          "address": address,
          "vehicle_type": vehicleType,
          "vehicle_make": vehicleMake,
          "plate_number": plateNumber,
          "type": "rider",
        },
        authenticated: true,
        transform: (r) => Map<String, dynamic>.from(r as Map),
      );
}
