class Transactions {
  final String id;
  final String senderId;
  final String receiverId;
  final String amount;
  final String note;
  final bool isRedeemed;
  final DateTime createdAt;

  Transactions({
    required this.isRedeemed,
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.amount,
    required this.note,
    required this.createdAt,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      amount: (json['quantity']).toString(),
      note: json['note'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isRedeemed: json['redeemed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'quantity': amount,
      'note': note,
      'createdAt': createdAt.toIso8601String(),
      'redeemed': isRedeemed,
    };
  }
}
