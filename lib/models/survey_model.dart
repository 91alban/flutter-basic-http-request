// import 'dart:convert';

class Survey {
  final String id;
  final String title;

  const Survey({
    required this.id,
    required this.title,
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      id: json['id'],
      title: json['title'],
    );
  }
}
