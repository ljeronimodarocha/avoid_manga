class Volume {
  Volume({
    required this.numero,
    required this.quantidade,
    required this.chapters,
  });
  int numero;
  int quantidade;
  Map<String, Chapter> chapters;

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      numero: int.parse(json['volume']),
      quantidade: json['count'],
      chapters: (json['chapters'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, Chapter.fromJson(value)),
      ),
    );
  }
}

class Chapter {
  Chapter({
    required this.numero,
    required this.id,
    required this.others,
    required this.count,
  });
  String numero;
  String id;
  List<String> others;
  int count;

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      numero: json['chapter'],
      id: json['id'],
      others: List<String>.from(json['others']),
      count: json['count'],
    );
  }
}
