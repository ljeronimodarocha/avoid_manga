class ChapterDTO {
  final String result;
  final String response;
  final ChapterData data;

  ChapterDTO({
    required this.result,
    required this.response,
    required this.data,
  });

  factory ChapterDTO.fromJson(Map<String, dynamic> json) {
    return ChapterDTO(
      result: json['result'] ?? '',
      response: json['response'] ?? '',
      data: ChapterData.fromJson(json['data'] ?? {}),
    );
  }
}

class ChapterData {
  final String id;
  final ChapterAttributes attributes;

  ChapterData({
    required this.id,
    required this.attributes,
  });

  factory ChapterData.fromJson(Map<String, dynamic> json) {
    return ChapterData(
      id: json['id'] ?? '',
      attributes: ChapterAttributes.fromJson(json['attributes'] ?? {}),
    );
  }
}

class ChapterAttributes {
  final String title;
  final String volume;
  final String chapter;
  final int pages;
  final String translatedLanguage;
  final String uploader;
  final String externalUrl;
  final int version;
  final String createdAt;
  final String updatedAt;
  final String publishAt;
  final String readableAt;

  ChapterAttributes({
    required this.title,
    required this.volume,
    required this.chapter,
    required this.pages,
    required this.translatedLanguage,
    required this.uploader,
    required this.externalUrl,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
    required this.publishAt,
    required this.readableAt,
  });

  factory ChapterAttributes.fromJson(Map<String, dynamic> json) {
    return ChapterAttributes(
      title: json['title'] ?? '',
      volume: json['volume'] ?? '',
      chapter: json['chapter'] ?? '',
      pages: json['pages'] ?? 0,
      translatedLanguage: json['translatedLanguage'] ?? '',
      uploader: json['uploader'] ?? '',
      externalUrl: json['externalUrl'] ?? '',
      version: json['version'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      publishAt: json['publishAt'] ?? '',
      readableAt: json['readableAt'] ?? '',
    );
  }
}
