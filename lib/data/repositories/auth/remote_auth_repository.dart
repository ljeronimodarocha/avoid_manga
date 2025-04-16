import 'dart:async';

import 'package:avoid_manga/data/repositories/auth/auth_repository.dart';
import 'package:avoid_manga/data/services/auth/auth_client_http.dart';
import 'package:avoid_manga/data/services/auth/auth_local_storage.dart';
import 'package:avoid_manga/domain/dtos/credentials.dart';
import 'package:avoid_manga/domain/entities/user_entity.dart';
import 'package:avoid_manga/domain/validators/credentials_validator.dart';
import 'package:avoid_manga/utils/validation/lucid_validator_extension.dart';
import 'package:result_dart/result_dart.dart';

class RemoteAuthRepository implements AuthRepository {
  RemoteAuthRepository(this._authLocalStorage, this._authClientHttp);

  final _streamController = StreamController<User>.broadcast();

  final AuthLocalStorage _authLocalStorage;
  final AuthClientHttp _authClientHttp;

  @override
  AsyncResult<LoggedUser> getuser() async {
    return await _authLocalStorage.getUser().onSuccess(_streamController.add);
  }

  @override
  AsyncResult<LoggedUser> login(Credentials credentials) async {
    final validator = CredentialsValidator();
    return await validator
        .validateResult(credentials)
        .flatMap(_authLocalStorage.saveCredentials)
        .flatMap(_authClientHttp.login)
        .flatMap(_authLocalStorage.saveUser)
        .onSuccess(_streamController.add);
  }

  @override
  AsyncResult<LoggedUser> refreshToken() async {
    var user = await _authLocalStorage.getUser().getOrNull();
    var credentials = await _authLocalStorage.getCredentials().getOrNull();
    if (user != null && credentials != null) {
      if (!user.isTokenValid()) {
        return await _authClientHttp
            .refresh(credentials, user.refreshToken)
            .flatMap(_authLocalStorage.saveUser);
      }
      return Success(user);
    }
    throw UnimplementedError();
  }

  @override
  AsyncResult<Unit> logout() {
    return _authLocalStorage
        .removeUser()
        .onSuccess((_) => _streamController.add(const NotLoggedUser()));
  }

  @override
  Stream<User> userObserver() {
    return _streamController.stream;
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
