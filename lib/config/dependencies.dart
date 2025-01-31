import 'package:auto_injector/auto_injector.dart';
import 'package:avoid_manga/data/repositories/auth_repository.dart';
import 'package:avoid_manga/data/repositories/remote_auth_repository.dart';
import 'package:avoid_manga/data/services/auth/auth_client_http.dart';
import 'package:avoid_manga/data/services/auth/auth_local_storage.dart';
import 'package:avoid_manga/data/services/auth/client_http.dart';
import 'package:avoid_manga/data/services/local_storage.dart';
import 'package:avoid_manga/ui/auth/viewmodels/login_viewmodel.dart';
import 'package:dio/dio.dart';

final injector = AutoInjector();

void setupDependencies() {
  injector.addSingleton<AuthRepository>(RemoteAuthRepository.new);
  injector.addInstance(Dio());
  injector.addSingleton(ClienteHttp.new);
  injector.addSingleton(LocalStorage.new);
  injector.addSingleton(AuthClientHttp.new);
  injector.addSingleton(AuthLocalStorage.new);
  injector.addSingleton(LoginViewModel.new);
  injector.commit();
}
