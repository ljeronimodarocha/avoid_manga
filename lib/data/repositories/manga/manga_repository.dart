import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:avoid_manga/domain/entities/volume_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class MangaRepository {
  AsyncResult<List<Manga>> getMangas(String? name, int offset);

  AsyncResult<List<Volume>> getVolumes(String idManga);
}
