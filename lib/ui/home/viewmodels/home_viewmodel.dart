import 'package:avoid_manga/data/repositories/manga/manga_repository.dart';
import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class HomeViewmodel {
  HomeViewmodel(this._mangaRepository);

  final List<Manga> _mangas = [];
  List<Manga> _foundMangas = [];

  List<Manga> get mangas => _mangas;
  List<Manga> get foundMangas => _foundMangas;

  final MangaRepository _mangaRepository;

  late final mangaComand = Command1(_listMangas);
  late final findMangaComand = Command1(_findMangaByTitle);

  AsyncResult<Unit> _listMangas(int offset) async {
    await _mangaRepository.getMangas('', offset).onSuccess((success) {
      _mangas.addAll(success);
    });
    return Success.unit();
  }

  AsyncResult<Unit> _findMangaByTitle(String name) async {
    if (name.isEmpty) {
      _foundMangas =[ ];
      return Success.unit();
    }
    await _mangaRepository.getMangas(name, 10).onSuccess((success) {
      _foundMangas = success;
    });
    return Success.unit();
  }
}
