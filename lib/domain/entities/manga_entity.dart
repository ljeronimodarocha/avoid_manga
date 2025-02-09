import 'package:avoid_manga/config/manga_response_converter.dart';
import 'package:avoid_manga/domain/dtos/manga_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga_entity.freezed.dart';
part 'manga_entity.g.dart';

@freezed
sealed class Manga with _$Manga {
  const factory Manga(@MangaResponseConverter() String id, String type,
      String title, String? description, String? fileName) = _Manga;

  factory Manga.fromJsonCustom(Map<String, dynamic> json) => Manga(json["id"],
      json["type"], json["title"], json["description"], json["fileName"]);

  factory Manga.fromJson(Map<String, dynamic> json) => Manga(
        json["id"],
        json["type"],
        json["attributes"]["title"]["en"],
        json["attributes"]["description"]["en"],
        json["relationships"]
                .firstWhere(
                  (rel) => rel["type"] == "cover_art",
                  orElse: () => null,
                )
                .isNotEmpty
            ? json["relationships"].firstWhere(
                (rel) => rel["type"] == "cover_art",
                orElse: () => null,
              )["attributes"]["fileName"]
            : null,
      );

  factory Manga.convertToManga(MangaDTO dto) => Manga(
      dto.id,
      dto.type,
      dto.attributes.title.entries.firstOrNull?.value as String,
      dto.attributes.description.entries.firstOrNull?.value,
      dto.relationships
          .firstWhere((r) => r.attributes != null)
          .attributes
          ?.fileName);
}
