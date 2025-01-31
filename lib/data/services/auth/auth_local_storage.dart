import 'dart:convert';

import 'package:avoid_manga/data/services/local_storage.dart';
import 'package:avoid_manga/domain/entities/user_entity.dart';
import 'package:result_dart/result_dart.dart';

const _userKey = '_userKey';

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

  AsyncResult<Unit> removeUser() {
    return _localStorage.removeData(_userKey);
  }
}
