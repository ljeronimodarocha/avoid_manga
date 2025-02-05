import 'dart:async';

import 'package:avoid_manga/data/repositories/auth/auth_repository.dart';
import 'package:avoid_manga/domain/entities/user_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:result_dart/result_dart.dart';

class MainViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository;

  User _user = const NotLoggedUser();
  User get user => _user;

  late final StreamSubscription _userSubscription;

  MainViewmodel(this._authRepository) {
    _userSubscription = _authRepository.userObserver().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  AsyncResult<Unit> checkLoggedUser() async {
    await _authRepository.getuser();
    return Success.unit();
  }

  @override
  void dispose() {
    super.dispose();
    _userSubscription.cancel();
  }
}
