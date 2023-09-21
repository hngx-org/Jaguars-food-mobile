
class Withdrawals{
  final String id;
  final String userId;
  final String status;
  final BigInt amount;
  final DateTime createdAt;

  Withdrawals({
    required this.id,
    required this.userId,
    required this.status,
    required this.amount,
    required this.createdAt,
  });

  factory Withdrawals.fromJson(Map<String, dynamic> json) {
    return Withdrawals(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      status: json['status'] as String,
      amount: BigInt.parse(json['amount']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'status': status,
      'amount': amount.toString(),
      'created_at': createdAt.toIso8601String(),
    };
  }
}