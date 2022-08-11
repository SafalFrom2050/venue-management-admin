class Participation {
  final int? id;
  final int? userId;
  final String? user;
  final String? event;
  final String? createdAt;

  const Participation({this.id, this.userId, this.user, this.event, this.createdAt});

  factory Participation.fromJson(Map<String, dynamic> json) {
    return Participation(
      id: json['id'],
      userId: json['userId'],
      user: json['user'],
      event: json['event'],
      createdAt: json['createdAt'],
    );
  }

  Map toJson() => {
        'id': id,
        'userId': userId,
        'user': user,
        'event': event,
        // 'createdAt': createdAt,
      };
}
