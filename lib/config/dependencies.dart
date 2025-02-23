import 'package:auto_injector/auto_injector.dart';
import 'package:avoid_manga/data/repositories/auth/auth_repository.dart';
import 'package:avoid_manga/data/repositories/auth/remote_auth_repository.dart';
import 'package:avoid_manga/data/repositories/manga/manga_repository.dart';
import 'package:avoid_manga/data/repositories/manga/remote_manga_repository.dart';
import 'package:avoid_manga/data/services/auth/auth_client_http.dart';
import 'package:avoid_manga/data/services/auth/auth_local_storage.dart';
import 'package:avoid_manga/data/services/client_http.dart';
import 'package:avoid_manga/data/services/local_storage.dart';
import 'package:avoid_manga/data/services/manga/manga_client_http.dart';
import 'package:avoid_manga/main_viewmodel.dart';
import 'package:avoid_manga/ui/auth/viewmodels/login_viewmodel.dart';
import 'package:avoid_manga/ui/home/viewmodels/home_viewmodel.dart';
import 'package:avoid_manga/ui/manga/viewmodels/manga_viewmodel.dart';
import 'package:dio/dio.dart';

final injector = AutoInjector();

void setupDependencies() {
  injector.addSingleton<AuthRepository>(RemoteAuthRepository.new);
  injector.addSingleton<MangaRepository>(RemotemangaRepository.new);
  injector.addInstance(Dio());
  injector.addSingleton(ClienteHttp.new);
  injector.addSingleton(LocalStorage.new);
  injector.addSingleton(AuthClientHttp.new);
  injector.addSingleton(AuthLocalStorage.new);
  injector.addSingleton(MangaClientHttp.new);

  injector.addSingleton(LoginViewModel.new);
  injector.addSingleton(MainViewmodel.new);
  injector.addSingleton(HomeViewmodel.new);
  injector.addSingleton(MangaViewmodel.new);
  injector.commit();
}
