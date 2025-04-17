import 'package:avoid_manga/data/repositories/manga/manga_repository.dart';
import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:avoid_manga/main.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';
import 'package:routefly/routefly.dart';

class HomeViewmodel {
  HomeViewmodel(this._mangaRepository);

  final List<Manga> _mangas = [];
  final List<Manga> _mangasFavotited = [];

  List<Manga> get mangas => _mangas;
  List<Manga> get mangasFavotited => _mangasFavotited;

  final MangaRepository _mangaRepository;

  late final mangaComand = Command1(_listMangas);
  late final mangaFavoritedComand = Command1(_listMangasFavorited);
  late final findMangaComand = Command1(_findMangaByTitle);

  AsyncResult<Unit> _listMangas(int offset) async {
    await _mangaRepository.getMangas('', offset).onSuccess((success) {
      if (offset == 0) {
        _mangas.clear();
      }
      _mangas.addAll(success);
    });
    return Success.unit();
  }

  AsyncResult<Unit> _listMangasFavorited(int offset) async {
    await _mangaRepository.getMangasFavorited('', offset).onSuccess((success) {
      if (offset == 0) {
        _mangasFavotited.clear();
      }
      _mangasFavotited.addAll(success);
    });
    return Success.unit();
  }

  AsyncResult<List<Manga>> _findMangaByTitle(String name) async {
    return await _mangaRepository.getMangas(name, 5);
  }

  void goToMangaPage(Manga manga) {
    Routefly.push(routePaths.manga, arguments: manga.toJson());
  }
}
