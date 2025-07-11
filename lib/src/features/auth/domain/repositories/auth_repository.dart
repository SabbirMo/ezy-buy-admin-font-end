import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure,LoginEntity>> login({required String email, required String password});
}
