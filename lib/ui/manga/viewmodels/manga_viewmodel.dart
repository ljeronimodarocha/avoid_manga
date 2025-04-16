import 'package:avoid_manga/data/repositories/manga/manga_repository.dart';
import 'package:avoid_manga/data/repositories/volume/volume_repository.dart';
import 'package:avoid_manga/domain/entities/volume_entity.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class MangaViewmodel {
  MangaViewmodel(this._volumeRepository, this._mangaRepository);

  final VolumeRepository _volumeRepository;
  final MangaRepository _mangaRepository;

  late List<Volume> _volumes = [];

  late final volumesComand = Command1(_listVolumes);
  late final isFollowMangaCommand = Command1(_isFollowManga);

  late final addFavoritedCommand = Command2(_addFavorited);

  List<Volume> get volumes => _volumes;

  AsyncResult<Unit> _addFavorited(String idManga, bool addFavorited) async {
    if (addFavorited){
       return await _mangaRepository.followManga(idManga);
    }else {
      return await _mangaRepository.unfollowManga(idManga);
    }
  }

  AsyncResult<Unit> _listVolumes(String idManga) async {
    await _volumeRepository.getVolumes(idManga).onSuccess((success) {
      _volumes = success;
    });
    return Success.unit();
  }

  AsyncResult<bool> _isFollowManga(String id) async {
    return await _mangaRepository.isFollowManga(id);
  }
}
