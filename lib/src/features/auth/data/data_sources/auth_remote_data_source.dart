import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/api_exceptions.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/url_manager.dart';
import '../models/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.dioClient);

  final DioClient dioClient;

  @override
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await dioClient.post(url: UrlManager.loginUrl, body: {"email": email, "password": password});
      final data = LoginModel.fromJson(json.decode(result));
      return data;
    } on ApiException {
      rethrow;
    } on DioException catch (e) {
      final errorData = DioExceptionHandler.handleException(e);
      throw ApiException(message: errorData.message, statusCode: errorData.statusCode);
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
