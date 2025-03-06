import 'package:avoid_manga/domain/entities/chapter_entity.dart';

class Volume {
  Volume({
    required this.numero,
    required this.quantidade,
    required this.chapters,
  });
  int numero;
  int quantidade;
  List<Chapter> chapters;

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      numero: int.tryParse(json['volume']) ?? 0,
      quantidade: json['count'],
      chapters: (json['chapters'] as Map<String, dynamic>)
          .values
          .map((value) => Chapter.fromJson(value))
          .toList(),
    );
  }
}
