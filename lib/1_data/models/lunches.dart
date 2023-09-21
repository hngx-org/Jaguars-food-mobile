
class Lunches{
  final String id;
  final String orgId;
  final String senderId;
  final String receiverId;
  final int quantity;
  final bool redeemed;
  final DateTime createdAt;
  final String note;

  Lunches({
    required this.id,
    required this.orgId,
    required this.senderId,
    required this.receiverId,
    required this.quantity,
    required this.redeemed,
    required this.createdAt,
    required this.note,
  });

  factory Lunches.fromJson(Map<String, dynamic> json) {
    return Lunches(
      id: json['id'] as String,
      orgId: json['org_id'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      quantity: json['quantity'] as int,
      redeemed: json['redeemed'] as bool,
      createdAt: DateTime.parse(json['created_at']),
      note: json['note'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'org_id': orgId,
      'senderld': senderId,
      'receiverld': receiverId,
      'quantity': quantity,
      'redeemed': redeemed,
      'created_at': createdAt.toIso8601String(),
      'note': note,
    };
  }

}