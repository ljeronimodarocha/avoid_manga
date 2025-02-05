import 'package:avoid_manga/data/repositories/manga/manga_repository.dart';
import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class HomeViewmodel {
  HomeViewmodel(this._mangaRepository);

  final List<Manga> _mangas = [];

  List<Manga> get mangas => _mangas;

  final MangaRepository _mangaRepository;

  late final mangaComand = Command1(_listMangas);

  AsyncResult<Unit> _listMangas(int offset) async {
    await _mangaRepository.getMangas(offset).onSuccess((success) {
      _mangas.addAll(success);
    });
    return Success.unit();
  }
}
