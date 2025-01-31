import 'package:avoid_manga/data/services/auth/client_http.dart';
import 'package:avoid_manga/domain/dtos/credentials.dart';
import 'package:avoid_manga/domain/entities/user_entity.dart';
import 'package:avoid_manga/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

class AuthClientHttp {
  final ClienteHttp _clienteHttp;

  AuthClientHttp(this._clienteHttp);

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
      return LoggedUser.fromJson(response.data);
    });
  }
}
