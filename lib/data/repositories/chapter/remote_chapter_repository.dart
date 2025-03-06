import 'package:avoid_manga/data/repositories/chapter/chapter_repository.dart';
import 'package:avoid_manga/data/services/chapter/chapter_client_http.dart';
import 'package:avoid_manga/domain/dtos/chapter_images.dart';
import 'package:result_dart/result_dart.dart';

class RemoteChapterRepository implements ChapterRepository {
  final ChapterClientHttp _chapterClientHttp;

  RemoteChapterRepository({required ChapterClientHttp chapterClientHttp})
      : _chapterClientHttp = chapterClientHttp;

  @override
  AsyncResult<ChapterImagesDTO> getChapterImages(String idVolume) {
    return _chapterClientHttp.getVolumeImages(idVolume);
  }
}
