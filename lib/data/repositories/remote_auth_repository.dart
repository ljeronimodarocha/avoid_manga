import 'dart:async';

import 'package:avoid_manga/data/repositories/auth_repository.dart';
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
  AsyncResult<LoggedUser> getuser() {
    return _authLocalStorage.getUser();
  }

  @override
  AsyncResult<LoggedUser> login(Credentials credentials) async {
    final validator = CredentialsValidator();
    return await validator
        .validateResult(credentials)
        .flatMap(_authClientHttp.login)
        .flatMap(_authLocalStorage.saveUser)
        .onSuccess(_streamController.add);
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
