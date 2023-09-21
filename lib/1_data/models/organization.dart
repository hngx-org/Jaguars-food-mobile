class Organization{
  final String id;
  final String name;
  final String email;
  final String lunchPrice;
  final String currency;

  Organization({
    required this.id,
    required this.name,
    required this.email,
    required this.lunchPrice,
    required this.currency,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      lunchPrice: json['lunch_price'] as String,
      currency: json['currency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'lunch_price': lunchPrice,
      'currency': currency,
    };
  }
}