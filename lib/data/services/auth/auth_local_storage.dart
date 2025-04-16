import 'dart:convert';

import 'package:avoid_manga/data/services/local_storage.dart';
import 'package:avoid_manga/domain/dtos/credentials.dart';
import 'package:avoid_manga/domain/entities/user_entity.dart';
import 'package:result_dart/result_dart.dart';

const _userKey = '_userKey';
const _userKeyCredentials = "_userKeyCredentials";

class AuthLocalStorage {
  final LocalStorage _localStorage;

  AuthLocalStorage(this._localStorage);

  AsyncResult<LoggedUser> getUser() {
    return _localStorage
        .getData(_userKey)
        .map((json) => LoggedUser.fromJson(jsonDecode(json)));
  }

  AsyncResult<LoggedUser> saveUser(LoggedUser user) {
    return _localStorage.saveData(_userKey, jsonEncode(user)).pure(user);
  }

  AsyncResult<Credentials> getCredentials() {
    return _localStorage
        .getData(_userKeyCredentials)
        .map((json) => Credentials.fromJson(jsonDecode(json)));
  }

  AsyncResult<Credentials> saveCredentials(Credentials credentials) {
    return _localStorage
        .saveData(_userKeyCredentials, jsonEncode(credentials))
        .pure(credentials);
  }

  AsyncResult<Unit> removeUser() {
    return _localStorage.removeData(_userKey);
  }
}
