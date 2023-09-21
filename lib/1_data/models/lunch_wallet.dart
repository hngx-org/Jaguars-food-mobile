
class LunchWallet{
  final String id;
  final String balance;
  final String orgId;

  LunchWallet({
    required this.id,
    required this.balance,
    required this.orgId,
  });

  factory LunchWallet.fromJson(Map<String, dynamic> json) {
    return LunchWallet(
      id: json['id'] as String,
      balance: json['balance'] as String,
      orgId: json['org_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'balance': balance,
      'org_id': orgId,
    };
  }
}