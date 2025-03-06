class Chapter {
  Chapter(
      {required this.numero,
      required this.id,
      required this.others,
      required this.count,
      this.baseUrl,
      this.hashChapter,
      this.images});
  String numero;
  String id;
  List<String> others;
  int count;
  String? baseUrl;
  String? hashChapter;
  List<String>? images;

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      numero: json['chapter'] ?? '',
      id: json['id'] ?? '',
      others: json['others'] != null ? List<String>.from(json['others']) : [],
      count: json['count'] ?? 0,
      baseUrl: json['baseUrl'],
      hashChapter: json['hash'],
      images: json['images'] != null ? List<String>.from(json['images']) : [],
    );
  }

  void setPictures(Map<String, dynamic> json) {
    baseUrl = json['baseUrl'];
    hashChapter = json['hash'];
    images = (json['chapter']['data'] as List<dynamic>)
        .map((image) => image.toString())
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'chapter': numero,
      'id': id,
      'others': others,
      'count': count,
      'baseUrl': baseUrl,
      'hash': hashChapter,
      'images': images,
    };
  }
}
