class MangaDTO {
  final String id;
  final String type;
  final MangaDTOAttributes attributes;
  final List<MangaRelationship> relationships;

  MangaDTO({
    required this.id,
    required this.type,
    required this.attributes,
    required this.relationships,
  });

  factory MangaDTO.fromJson(Map<String, dynamic> json) {
    return MangaDTO(
      id: json['id'],
      type: json['type'],
      attributes: MangaDTOAttributes.fromJson(json['attributes']),
      relationships: (json['relationships'] as List)
          .map((item) => MangaRelationship.fromJson(item))
          .toList(),
    );
  }
}

class MangaDTOAttributes {
  final Map<String, String> title;
  final List<Map<String, String>> altTitles;
  final Map<String, String> description;
  final bool isLocked;
  final Map<String, String> links;
  final String originalLanguage;
  final String status;
  final int? year;
  final String contentRating;
  final List<Tag> tags;
  final String state;
  final bool chapterNumbersResetOnNewVolume;
  final String createdAt;
  final String updatedAt;
  final int version;
  final List<String> availableTranslatedLanguages;
  final String latestUploadedChapter;

  MangaDTOAttributes({
    required this.title,
    required this.altTitles,
    required this.description,
    required this.isLocked,
    required this.links,
    required this.originalLanguage,
    required this.status,
    this.year,
    required this.contentRating,
    required this.tags,
    required this.state,
    required this.chapterNumbersResetOnNewVolume,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.availableTranslatedLanguages,
    required this.latestUploadedChapter,
  });

  factory MangaDTOAttributes.fromJson(Map<String, dynamic> json) {
    return MangaDTOAttributes(
      title: Map<String, String>.from(json['title']),
      altTitles: (json['altTitles'] as List)
          .map((item) => Map<String, String>.from(item))
          .toList(),
      description: Map<String, String>.from(json['description']),
      isLocked: json['isLocked'],
      links: Map<String, String>.from(json['links']),
      originalLanguage: json['originalLanguage'],
      status: json['status'],
      year: json['year'],
      contentRating: json['contentRating'],
      tags: (json['tags'] as List).map((item) => Tag.fromJson(item)).toList(),
      state: json['state'],
      chapterNumbersResetOnNewVolume: json['chapterNumbersResetOnNewVolume'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['version'],
      availableTranslatedLanguages:
          List<String>.from(json['availableTranslatedLanguages']),
      latestUploadedChapter: json['latestUploadedChapter'],
    );
  }
}

class Tag {
  final String id;
  final String type;
  final TagAttributes attributes;

  Tag({required this.id, required this.type, required this.attributes});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      type: json['type'],
      attributes: TagAttributes.fromJson(json['attributes']),
    );
  }
}

class TagAttributes {
  final Map<String, String> name;

  TagAttributes({required this.name});

  factory TagAttributes.fromJson(Map<String, dynamic> json) {
    return TagAttributes(
      name: Map<String, String>.from(json['name']),
    );
  }
}

class MangaRelationship {
  final String id;
  final String type;
  final String? related;
  final AttributesRelationship? attributes;

  MangaRelationship(
      {required this.id, required this.type, this.related, this.attributes});

  factory MangaRelationship.fromJson(Map<String, dynamic> json) {
    return MangaRelationship(
      id: json['id'],
      type: json['type'],
      related: json['related'],
      attributes: json['attributes'] != null
          ? AttributesRelationship(
              description: json['attributes']['description'],
              volume: json['attributes']['volume'],
              fileName: json['attributes']['fileName'],
              locale: json['attributes']['locale'],
              createdAt: json['attributes']['createdAt'],
              updatedAt: json['attributes']['updatedAt'],
              version: json['attributes']['version'],
            )
          : null,
    );
  }
}

class AttributesRelationship {
  final String? description;
  final String? volume;
  final String? fileName;
  final String? locale;
  final String? createdAt;
  final String? updatedAt;
  final int? version;

  AttributesRelationship(
      {required this.description,
      required this.volume,
      required this.fileName,
      required this.locale,
      required this.createdAt,
      required this.updatedAt,
      required this.version});
}
