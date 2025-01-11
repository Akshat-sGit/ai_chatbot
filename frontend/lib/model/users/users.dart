import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart'; 

@JsonSerializable()
class Users {
  final String userId;
  final String name;
  final String email;
  final DateTime createdAt;

  Users({required this.userId, required this.name, required this.email, required this.createdAt});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}