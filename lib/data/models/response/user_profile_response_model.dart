import 'dart:convert';

class UserProfileResponseModel {
  final int id;
  final String name;
  final String email;
  final String roles;
  final String phone;
  final String address;
  final String emailVerifiedAt;
  final String twoFactorSecret;
  final String twoFactorRecoveryCodes;
  final String twoFactorConfirmedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserProfileResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
    required this.phone,
    required this.address,
    required this.emailVerifiedAt,
    required this.twoFactorSecret,
    required this.twoFactorRecoveryCodes,
    required this.twoFactorConfirmedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProfileResponseModel.fromJson(String str) =>
      UserProfileResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserProfileResponseModel.fromMap(Map<String, dynamic> json) =>
      UserProfileResponseModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        roles: json["roles"],
        phone: json["phone"] ?? "",
        address: json["address"] ?? "",
        emailVerifiedAt: json["email_verified_at"] ?? "",
        twoFactorSecret: json["two_factor_secret"] ?? "",
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"] ?? "",
        twoFactorConfirmedAt: json["two_factor_confirmed_at"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "roles": roles,
        "phone": phone,
        "address": address,
        "email_verified_at": emailVerifiedAt,
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
