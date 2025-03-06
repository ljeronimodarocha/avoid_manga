import 'package:avoid_manga/domain/dtos/chapter_images.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class ChapterRepository {
  AsyncResult<ChapterImagesDTO> getChapterImages(String idVolume);
}
