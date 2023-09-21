class Transactions {
  final String id;
  final String senderId;
  final String receiverId;
  final double amount;
  final String status;
  final DateTime createdAt;

  Transactions({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.amount,
    required this.status,
    required this.createdAt,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'amount': amount,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
