// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MangaImpl _$$MangaImplFromJson(Map<String, dynamic> json) => _$MangaImpl(
      json['id'] as String,
      json['type'] as String,
      json['title'] as String,
      json['description'] as String?,
    );

Map<String, dynamic> _$$MangaImplToJson(_$MangaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
    };
