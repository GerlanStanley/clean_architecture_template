import '../../domain/entities/entities.dart';

extension AuthDto on AuthEntity {
  static AuthEntity fromJson(Map json) {
    return AuthEntity(
      token: json['token'],
      email: json['email'],
      name: json['name'],
    );
  }

  Map toJson() {
    return {
      'token': token,
      'email': email,
      'name': name,
    };
  }
}