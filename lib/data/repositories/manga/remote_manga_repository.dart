import 'package:avoid_manga/data/repositories/manga/manga_repository.dart';
import 'package:avoid_manga/data/services/manga/manga_client_http.dart';
import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:avoid_manga/domain/entities/volume_entity.dart';
import 'package:result_dart/result_dart.dart';

class RemotemangaRepository implements MangaRepository {
  RemotemangaRepository(this._mangaClientHttp);

  final MangaClientHttp _mangaClientHttp;

  @override
  AsyncResult<List<Manga>> getMangas(String? name, int offset) {
    return _mangaClientHttp.getMangas(name, offset);
  }

  @override
  AsyncResult<List<Volume>> getVolumes(String idManga) {
    return _mangaClientHttp.getVolumes(idManga);
  }
}
