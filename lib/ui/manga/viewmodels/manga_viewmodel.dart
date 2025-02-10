import 'package:avoid_manga/data/repositories/manga/manga_repository.dart';
import 'package:avoid_manga/domain/entities/volume_entity.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class MangaViewmodel {
  MangaViewmodel(this._mangaRepository);

  final MangaRepository _mangaRepository;
  late List<Volume> _volumes = [];

  late final volumesComand = Command1(_listVolumes);

  List<Volume> get volumes => _volumes;

  AsyncResult<Unit> _listVolumes(String idManga) async {
    await _mangaRepository.getVolumes(idManga).onSuccess((success) {
      _volumes = success;
    });
    return Success.unit();
  }
}
