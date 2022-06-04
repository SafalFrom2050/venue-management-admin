class FeedbackInfo {
  final int? id;
  final String? username;
  final String? email;
  final String? phone;
  final String? feedback;
  final String? createdAt;

  const FeedbackInfo(
      {this.id,
      this.username,
      this.email,
      this.phone,
      this.feedback,
      this.createdAt});

  factory FeedbackInfo.fromJson(Map<String, dynamic> json) {
    return FeedbackInfo(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      feedback: json['feedback'],
      createdAt: json['createdAt'],
    );
  }

  Map toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'phone': phone,
        'feedback': feedback,
        'createdAt': createdAt,
      };
}
