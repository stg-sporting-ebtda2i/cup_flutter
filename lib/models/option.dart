
import 'dart:convert';

class Option {
  final int id;
  final String name;
  final int order;
  final String? picture;

  Option({
    required this.id,
    required this.name,
    required this.order,
    required this.picture,
  });

  static Option fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
      order: json['order'],
    );
  }
}