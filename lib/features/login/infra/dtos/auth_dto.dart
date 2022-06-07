import '../../domain/entities/entities.dart';

class AuthDto extends AuthEntity {
  AuthDto({
    required String token,
    required String email,
    required String name,
  }) : super(
          token: token,
          email: email,
          name: name,
        );

  factory AuthDto.fromJson(Map json) {
    return AuthDto(
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
