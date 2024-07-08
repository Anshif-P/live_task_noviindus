import 'dart:convert';
import 'dart:io';
import 'package:either_dart/either.dart';

import 'package:http/http.dart' as http;
import 'package:noviindus_live_task_/src/util/app_exception/app_exception.dart';
import 'package:noviindus_live_task_/src/util/typedef/type_def.dart';

class ApiService {
  // ignore: prefer_final_fields
  static Map<String, String>? _header = {
    'Content-Type': 'application/json',
    'access': ''
  };

  static EitherResponse postApi(String url, Map map,
      [String? userToken]) async {
    final uri = Uri.parse(url);
    if (userToken != null) {
      _header!['access'] = userToken;
    }
    final body = jsonEncode(map);
    dynamic fetchedData;
    try {
      final response = await http.post(uri, body: body, headers: _header);
      print(response.body);

      fetchedData = _getResponse(response);

      return Right(fetchedData);
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOutException());
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  static EitherResponse getApi(String url, [String? token]) async {
    print(
        "$url, ---------------------------------------------------------  $token");

    final uri = Uri.parse(url);
    if (token != null) {
      _header!['access'] = token;
    }
    try {
      dynamic fetchedData;
      final response = await http.get(uri, headers: _header);
      print('hello get response ------------------------');
      print(response.body);
      fetchedData = _getResponse(response);

      return Right(fetchedData);
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOutException());
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  static _getResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return (jsonDecode(response.body));
      case 202:
        return (jsonDecode(response.body));
      case 400:
        return throw BadRequestException();
      default:
        throw BadRequestException();
    }
  }
}
