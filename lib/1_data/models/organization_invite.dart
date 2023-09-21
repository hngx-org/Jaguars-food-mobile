class OrganizationInvite{
  final String id;
  final String name;
  final String token;
  final DateTime ttl;

  OrganizationInvite({
    required this.id,
    required this.name,
    required this.token,
    required this.ttl,
  });

  factory OrganizationInvite.fromJson(Map<String, dynamic> json) {
    return OrganizationInvite(
      id: json['id'] as String,
      name: json['name'] as String,
      token: json['token'] as String,
      ttl: DateTime.parse(json['TTL']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'token': token,
      'TTL': ttl.toIso8601String(),
    };
  }
}