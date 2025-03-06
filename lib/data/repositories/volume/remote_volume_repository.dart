import 'package:avoid_manga/data/repositories/volume/volume_repository.dart';
import 'package:avoid_manga/data/services/volume/volume_client_http.dart';
import 'package:avoid_manga/domain/entities/volume_entity.dart';
import 'package:result_dart/result_dart.dart';

class RemoteVolumeRepository implements VolumeRepository {
  RemoteVolumeRepository(this._volumeClientHttp);

  final VolumeClientHttp _volumeClientHttp;

  @override
  AsyncResult<List<Volume>> getVolumes(String idManga) {
    return _volumeClientHttp.getVolumes(idManga);
  }
}
