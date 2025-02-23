import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class MangaResponseConverter
    implements JsonConverter<Manga, Map<String, dynamic>> {
  const MangaResponseConverter();

  @override
  Manga fromJson(Map<String, dynamic> json) {
    return Manga.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Manga data) => data.toJson();
}
