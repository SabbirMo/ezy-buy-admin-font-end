import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/login_entity.dart';
import '../repositories/auth_repository.dart';



class DoLoginUseCase {
  final AuthRepository repository;

  DoLoginUseCase(this.repository);

  Future<Either<Failure, LoginEntity>> execute({
    required String email,
    required String password,
  }) async {
    return await repository.login(email: email, password: password);
  }
}
