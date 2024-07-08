import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:dio/dio.dart';
import 'package:noviindus_live_task_/src/util/app_exception/app_exception.dart';

import '../../util/typedef/type_def.dart';

class ApiService {
  static final Map<String, String> _header = {
    'Content-Type': 'application/json',
    'Authorization': ''
  };

  static final Dio _dio = Dio();

  static EitherResponse postApi(String url, Map<String, dynamic> map,
      [String? token]) async {
    if (token != null) {
      _header['Authorization'] = 'Bearer $token';
    }
    final formData = FormData.fromMap(map);
    try {
      final response = await _dio.post(url,
          data: formData, options: Options(headers: _header));
      final fetchedData = _getResponse(response);
      return Right(fetchedData);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return Left(InternetException());
      } else {
        return Left(BadRequestException());
      }
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  static EitherResponse postFormData(String url, Map<String, dynamic> map,
      [String? token]) async {
    if (token != null) {
      _header['Authorization'] = 'Bearer $token';
    }
    final formData = FormData.fromMap(map);
    final response = await _dio.postUri(Uri.parse(url),
        data: formData, options: Options(headers: _header));
    final fetchedData = _getResponse(response);
    return Right(fetchedData);
  }

  static EitherResponse getApi(String url, [String? token]) async {
    if (token != null) {
      _header['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await _dio.get(url, options: Options(headers: _header));
      final fetchedData = _getResponse(response);
      return Right(fetchedData);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return Left(InternetException());
      } else {
        return Left(BadRequestException());
      }
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  static _getResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        return throw BadRequestException();
      default:
        throw BadRequestException();
    }
  }
}
