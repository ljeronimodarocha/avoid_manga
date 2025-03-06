import 'package:auto_injector/auto_injector.dart';
import 'package:avoid_manga/data/repositories/auth/auth_repository.dart';
import 'package:avoid_manga/data/repositories/auth/remote_auth_repository.dart';
import 'package:avoid_manga/data/repositories/chapter/chapter_repository.dart';
import 'package:avoid_manga/data/repositories/chapter/remote_chapter_repository.dart';
import 'package:avoid_manga/data/repositories/manga/manga_repository.dart';
import 'package:avoid_manga/data/repositories/manga/remote_manga_repository.dart';
import 'package:avoid_manga/data/repositories/volume/remote_volume_repository.dart';
import 'package:avoid_manga/data/repositories/volume/volume_repository.dart';
import 'package:avoid_manga/data/services/auth/auth_client_http.dart';
import 'package:avoid_manga/data/services/auth/auth_local_storage.dart';
import 'package:avoid_manga/data/services/chapter/chapter_client_http.dart';
import 'package:avoid_manga/data/services/client_http.dart';
import 'package:avoid_manga/data/services/local_storage.dart';
import 'package:avoid_manga/data/services/manga/manga_client_http.dart';
import 'package:avoid_manga/data/services/volume/volume_client_http.dart';
import 'package:avoid_manga/main_viewmodel.dart';
import 'package:avoid_manga/ui/auth/viewmodels/login_viewmodel.dart';
import 'package:avoid_manga/ui/chapter/modelview/chapter_modelview.dart';
import 'package:avoid_manga/ui/home/viewmodels/home_viewmodel.dart';
import 'package:avoid_manga/ui/manga/viewmodels/manga_viewmodel.dart';
import 'package:dio/dio.dart';

final injector = AutoInjector();

void setupDependencies() {
  injector.addSingleton<AuthRepository>(RemoteAuthRepository.new);
  injector.addSingleton<MangaRepository>(RemoteMangaRepository.new);
  injector.addSingleton<VolumeRepository>(RemoteVolumeRepository.new);
  injector.addSingleton<ChapterRepository>(RemoteChapterRepository.new);

  injector.addInstance(Dio());

  injector.addSingleton(ClienteHttp.new);
  injector.addSingleton(LocalStorage.new);
  injector.addSingleton(AuthClientHttp.new);
  injector.addSingleton(AuthLocalStorage.new);
  injector.addSingleton(MangaClientHttp.new);
  injector.addSingleton(VolumeClientHttp.new);
  injector.addSingleton(ChapterClientHttp.new);

  injector.addSingleton(LoginViewModel.new);
  injector.addSingleton(MainViewmodel.new);
  injector.addSingleton(HomeViewmodel.new);
  injector.addSingleton(MangaViewmodel.new);
  injector.addSingleton(ChapterViewModel.new);
  injector.commit();
}
