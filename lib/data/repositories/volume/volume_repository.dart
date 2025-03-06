import 'package:avoid_manga/domain/entities/volume_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class VolumeRepository {
  AsyncResult<List<Volume>> getVolumes(String idManga);
}
