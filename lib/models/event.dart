class Event {
  final int id;
  final String title;
  final String details;
  final String imagePath;
  final String photographer;
  final String price;
  final String createdAt;

  const Event(
      {required this.id,
      required this.title,
      required this.details,
      required this.imagePath,
      required this.photographer,
      required this.price,
      required this.createdAt});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      details: json['details'],
      imagePath: json['imagePath'],
      photographer: json['photographer'],
      price: json['price'],
      createdAt: json['createdAt'],
    );
  }

  Map toJson() => {
        'id': id,
        'title': title,
        'details': details,
        'imagePath': imagePath,
        'photographer': photographer,
        'price': price,
        // 'createdAt': createdAt,
      };
}
