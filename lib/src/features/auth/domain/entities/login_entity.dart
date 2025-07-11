import 'package:equatable/equatable.dart';

class LoginEntity {
  final String? message;
  final String? token;
  final UserEntity? user;

  LoginEntity({
    required this.message,
    required this.token,
    required this.user,
  });
}

class UserEntity {
  final String? id;
  final String? name;
  final String? email;
  final RoleEntity? role;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });
}

class RoleEntity extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const RoleEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  @override
  List<Object?> get props => [id, name, description, createdAt, updatedAt];
}
