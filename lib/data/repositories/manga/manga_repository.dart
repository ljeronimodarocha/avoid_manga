import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class MangaRepository {
  AsyncResult<List<Manga>> getMangas(String? name, int offset);
  
  AsyncResult<List<Manga>> getMangasFavorited(String? name, int offset);

  AsyncResult<Unit> updateReadManga(String id);

  AsyncResult<Unit> followManga(String id);

  AsyncResult<bool> isFollowManga(String id);

  AsyncResult<Unit> unfollowManga(String id);
}
