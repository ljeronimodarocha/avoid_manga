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
      numero: json['chapter'] ?? '',
      id: json['id'] ?? '',
      others: json['others'] != null ? List<String>.from(json['others']) : [],
      count: json['count'] ?? 0,
    );
  }
}
