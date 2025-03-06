class ChapterImagesDTO {
  final String baseUrl;
  final String hashChapter;
  final List<String> images;

  ChapterImagesDTO(
      {required this.images, required this.hashChapter, required this.baseUrl});

  factory ChapterImagesDTO.fromJson(Map<String, dynamic> json) {
    return ChapterImagesDTO(
      baseUrl: json['baseUrl'],
      hashChapter: json['chapter']['hash'],
      images: List<String>.from(json['chapter']['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
    };
  }
}
