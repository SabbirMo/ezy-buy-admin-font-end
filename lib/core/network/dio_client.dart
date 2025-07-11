import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/shared_preference_utils.dart';

class DioClient {
  static const int timeOutDuration = 60;

  Dio dio = Dio(
    BaseOptions(
      sendTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
    ),
  )..interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final String token = SharedPrefUtil.getToken();
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    ]);

  //GET
  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    try {
      var response = await dio
          .get(
            url,
            options: Options(contentType: 'application/json'),
            queryParameters: params,
          )
          .timeout(const Duration(seconds: timeOutDuration));

      return response.data;
    } catch (e) {
      //  printResponse(url, "${header ?? ""}", '', "$e");
      rethrow;
    }
  }

  //POST

  Future<dynamic> post({required String url, Map<String, dynamic>? params, dynamic body}) async {
    var payload = json.encode(body);
    try {
      var response = await dio
          .post(
            url,
            queryParameters: params,
            data: payload,
          )
          .timeout(const Duration(seconds: timeOutDuration));

      return jsonEncode(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //PATCH

  Future<dynamic> patch({required String url, Map<String, dynamic>? params, dynamic body}) async {
    var payload = json.encode(body);
    try {
      var response = await dio
          .patch(
            url,
            queryParameters: params,
            data: payload,
          )
          .timeout(const Duration(seconds: timeOutDuration));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //DELETE
  Future<dynamic> delete({required String url, Map<String, dynamic>? params, dynamic body}) async {
    var payload = json.encode(body);
    try {
      var response = await dio
          .delete(
            url,
            queryParameters: params,
            data: payload,
          )
          .timeout(const Duration(seconds: timeOutDuration));

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //MULTIPART FOR MULTIPLE FILE UPLOAD

  List<File>? docFileList = [];
  Future<dynamic> multipartRequest({
    required String url,
    Map<String, dynamic>? params,
    required Map<String, dynamic> body,
    String? filepath,
  }) async {
    var formData = FormData.fromMap(body);
    for (var files in docFileList!) {
      filepath = files.path;
      formData.files.addAll([MapEntry("document[]", await MultipartFile.fromFile(filepath))]);
    }

    try {
      var response = await dio
          .post(url, queryParameters: params, data: formData)
          .timeout(const Duration(seconds: timeOutDuration));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> multipartSingleFile(
      {required String url,
      Map<String, dynamic>? params,
      required Map<String, dynamic> body,
      String? filepath,
      required String key}) async {
    var formData = FormData.fromMap(body);
    if (filepath != null) {
      formData.files.add(MapEntry(key, await MultipartFile.fromFile(filepath)));
    }

    try {
      var response = await dio
          .post(url, queryParameters: params, data: formData)
          .timeout(const Duration(seconds: timeOutDuration));

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> downloadPdf({
    required String url,
    required String fileName,
    Map<String, dynamic>? params,
  }) async {
    try {
      var response =
          await dio.download(url, fileName, queryParameters: params).timeout(const Duration(seconds: timeOutDuration));
      log(response.toString());
      return "";
    } catch (e) {
      rethrow;
    }
  }
}
