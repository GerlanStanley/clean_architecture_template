import 'package:flutter_test/flutter_test.dart';

import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';

import 'package:clean_architecture_template/features/login/domain/entities/entities.dart';
import 'package:clean_architecture_template/features/login/domain/errors/errors.dart';
import 'package:clean_architecture_template/features/login/domain/repositories/repositories.dart';
import 'package:clean_architecture_template/features/login/domain/use_cases/use_cases.dart';
import 'package:clean_architecture_template/core/helpers/either_extension.dart';

class AuthRepositoryMock extends Mock implements PostAuthRepository {}

void main() {
  final repository = AuthRepositoryMock();
  final useCase = PostAuthUseCaseImp(repository);

  setUpAll(() {
    registerFallbackValue(AuthUseCaseParams(
      email: faker.internet.email(),
      password: faker.internet.password(),
    ));
  });

  test("Deve retornar ValidationPostAuthError se o email for inválido", () async {
    var result = await useCase(AuthUseCaseParams(
      email: "teste",
      password: faker.internet.password(),
    ));

    expect(result.asLeft(), isA<ValidationPostAuthError>());
  });

  test("Deve retornar ValidationPostAuthError se o password não for informado", () async {
    var result = await useCase(AuthUseCaseParams(
      email: faker.internet.email(),
      password: "",
    ));

    expect(result.asLeft(), isA<ValidationPostAuthError>());
  });

  test("Login com sucesso", () async {
    when(() => repository(any())).thenAnswer(
      (_) async => Right<PostAuthError, AuthEntity>(AuthEntity(
        token: faker.guid.guid(),
        name: faker.person.name(),
        email: faker.internet.email(),
      )),
    );

    var result = await useCase(AuthUseCaseParams(
      email: faker.internet.email(),
      password: faker.internet.password(),
    ));

    expect(result.asRight(), isA<AuthEntity>());
  });
}