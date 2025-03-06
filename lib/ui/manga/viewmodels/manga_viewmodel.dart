import 'package:avoid_manga/data/repositories/volume/volume_repository.dart';
import 'package:avoid_manga/domain/entities/volume_entity.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class MangaViewmodel {
  MangaViewmodel(this._volumeRepository);

  final VolumeRepository _volumeRepository;
  late List<Volume> _volumes = [];

  late final volumesComand = Command1(_listVolumes);

  List<Volume> get volumes => _volumes;

  AsyncResult<Unit> _listVolumes(String idManga) async {
    await _volumeRepository.getVolumes(idManga).onSuccess((success) {
      _volumes = success;
    });
    return Success.unit();
  }
}
