import 'package:avoid_manga/data/repositories/chapter/chapter_repository.dart';
import 'package:avoid_manga/domain/entities/chapter_entity.dart';
import 'package:avoid_manga/main.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';
import 'package:routefly/routefly.dart';

class ChapterViewModel {
  final ChapterRepository _chapterRepository;

  ChapterViewModel(this._chapterRepository);

  late final setChapterImages = Command1(_setChapterImages);

  AsyncResult<Chapter> _setChapterImages(Chapter chapter) async {
    await _chapterRepository.getChapterImages(chapter.id).onSuccess((sucees) {
      chapter.baseUrl = sucees.baseUrl;
      chapter.hashChapter = sucees.hashChapter;
      chapter.images = sucees.images;
    }).onFailure((error) {});
    return Success(chapter);
  }

  void goToChapterPage(Chapter chapter) async {
    await _setChapterImages(chapter).onSuccess((chapter) {
      Routefly.push(routePaths.chapter, arguments: chapter);
    });
  }
}
