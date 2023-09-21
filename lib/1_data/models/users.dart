
class Users {
  final String id;
  final String orgId;
  final String firstName;
  final String lastName;
  final String profilePicture;
  final String email;
  final int phoneNumber;
  final String passwordHash;
  final bool isAdmin;
  final String lunchCreditBalance;
  final String refreshToken;
  final String bankNumber;
  final String bankCode;
  final String bankName;
  final String bankRegion;
  final String currency;
  final String currencyCode;
  final DateTime updatedAt;
  final DateTime createdAt;

  Users({
    required this.id,
    required this.orgId,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
    required this.email,
    required this.phoneNumber,
    required this.passwordHash,
    required this.isAdmin,
    required this.lunchCreditBalance,
    required this.refreshToken,
    required this.bankNumber,
    required this.bankCode,
    required this.bankName,
    required this.bankRegion,
    required this.currency,
    required this.currencyCode,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] as String,
      orgId: json['org_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      profilePicture: json['profile_picture'] as String,
      email: json['email'] as String,
      phoneNumber: json['phonenumber'] as int,
      passwordHash: json['password_hash'] as String,
      isAdmin: json['isAdmin'] as bool,
      lunchCreditBalance: json['lunch_credit_balance'] as String,
      refreshToken: json['refresh_token'] as String,
      bankNumber: json['bank_number'] as String,
      bankCode: json['bank_code'] as String,
      bankName: json['bank_name'] as String,
      bankRegion: json['bank_region'] as String,
      currency: json['currency'] as String,
      currencyCode: json['currency_code'] as String,
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'org_id': orgId,
      'first_name': firstName,
      'last_name': lastName,
      'profile_picture': profilePicture,
      'email': email,
      'phonenumber': phoneNumber,
      'password_hash': passwordHash,
      'isAdmin': isAdmin,
      'lunch_credit_balance': lunchCreditBalance,
      'refresh_token': refreshToken,
      'bank_number': bankNumber,
      'bank_code': bankCode,
      'bank_name': bankName,
      'bank_region': bankRegion,
      'currency': currency,
      'currency_code': currencyCode,
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
    };
  }
}
