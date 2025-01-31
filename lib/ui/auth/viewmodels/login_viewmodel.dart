import 'package:avoid_manga/data/repositories/auth_repository.dart';
import 'package:avoid_manga/domain/dtos/credentials.dart';
import 'package:avoid_manga/domain/entities/user_entity.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class LoginViewModel {
  LoginViewModel(this._authRepository);

  final AuthRepository _authRepository;

  late final login = Command1(_login);

  AsyncResultDart<LoggedUser, Exception> _login(Credentials credentials) async {
    return _authRepository.login(credentials);
  }

  AsyncResultDart<Object, Exception> getUser() async {
    return await _authRepository.getuser();
  }
}
