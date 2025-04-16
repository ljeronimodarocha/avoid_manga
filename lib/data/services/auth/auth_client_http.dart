import 'package:avoid_manga/data/services/client_http.dart';
import 'package:avoid_manga/domain/dtos/credentials.dart';
import 'package:avoid_manga/domain/entities/user_entity.dart';
import 'package:avoid_manga/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

class AuthClientHttp {
  final ClienteHttp _clienteHttp;

  AuthClientHttp(this._clienteHttp);

  AsyncResult<LoggedUser> refresh(
      Credentials credentials, String refreshToken) async {
    final response = await _clienteHttp.post(
        AppConstants.authURL,
        {
          'grant_type': 'refresh_token',
          'refresh_token': refreshToken,
          'client_id': credentials.clientId,
          'client_secret': credentials.clientSecret,
        },
        Options(
            contentType: Headers.formUrlEncodedContentType,
            receiveDataWhenStatusError: true,
            responseType: ResponseType.json));
    return response.map((response) {
      num refreshExpiresIn = DateTime.now()
          .add(const Duration(seconds: 900))
          .millisecondsSinceEpoch;
      num expiresIn = DateTime.now()
          .add(const Duration(seconds: 900))
          .millisecondsSinceEpoch;
      response.data['refresh_expires_in'] = refreshExpiresIn;
      response.data['expires_in'] = expiresIn;
      return LoggedUser.fromJson(response.data);
    });
  }

  AsyncResult<LoggedUser> login(Credentials credentials) async {
    final response = await _clienteHttp.post(
        AppConstants.authURL,
        {
          'grant_type': 'password',
          'username': credentials.username,
          'password': credentials.password,
          'client_id': credentials.clientId,
          'client_secret': credentials.clientSecret,
        },
        Options(
            contentType: Headers.formUrlEncodedContentType,
            receiveDataWhenStatusError: true,
            responseType: ResponseType.json));
    return response.map((response) {
      num refreshExpiresIn = DateTime.now()
          .add(const Duration(seconds: 900))
          .millisecondsSinceEpoch;
      num expiresIn = DateTime.now()
          .add(const Duration(seconds: 900))
          .millisecondsSinceEpoch;
      response.data['refresh_expires_in'] = refreshExpiresIn;
      response.data['expires_in'] = expiresIn;
      return LoggedUser.fromJson(response.data);
    });
  }
}
