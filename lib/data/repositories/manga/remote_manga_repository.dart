import 'package:avoid_manga/data/repositories/manga/manga_repository.dart';
import 'package:avoid_manga/data/services/manga/manga_client_http.dart';
import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:result_dart/result_dart.dart';

class RemoteMangaRepository implements MangaRepository {
  RemoteMangaRepository(this._mangaClientHttp);

  final MangaClientHttp _mangaClientHttp;

  @override
  AsyncResult<List<Manga>> getMangas(String? name, int offset) {
    return _mangaClientHttp.getMangas(name, offset);
  }

  @override
  AsyncResult<List<Manga>> getMangasFavorited(String? name, int offset) {
    return _mangaClientHttp.getMangasFavorited(name, offset);
  }

  @override
  AsyncResult<Unit> updateReadManga(String id) {
    return _mangaClientHttp.updateReadManga(id);
  }

  @override
  AsyncResult<Unit> unfollowManga(String id) {
    return _mangaClientHttp.unfollowManga(id);
  }

  @override
  AsyncResult<Unit> followManga(String id) {
    return _mangaClientHttp.followManga(id);
  }

  @override
  AsyncResult<bool> isFollowManga(String id) {
    return _mangaClientHttp.isFollowManga(id);
  }
}
