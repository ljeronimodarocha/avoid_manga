// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      json['grantType'] as String,
      json['clientId'] as String,
      json['clientSecre'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'grantType': instance.grantType,
      'clientId': instance.clientId,
      'clientSecre': instance.clientSecre,
      'runtimeType': instance.$type,
    };

_$NotLoggedUserImpl _$$NotLoggedUserImplFromJson(Map<String, dynamic> json) =>
    _$NotLoggedUserImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotLoggedUserImplToJson(_$NotLoggedUserImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoggedUserImpl _$$LoggedUserImplFromJson(Map<String, dynamic> json) =>
    _$LoggedUserImpl(
      json['access_token'] as String,
      json['expires_in'] as num,
      json['refresh_expires_in'] as num,
      json['refresh_token'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoggedUserImplToJson(_$LoggedUserImpl instance) =>
    <String, dynamic>{
      'access_token': instance.token,
      'expires_in': instance.expiresIn,
      'refresh_expires_in': instance.refreshExpiresIn,
      'refresh_token': instance.refreshToken,
      'runtimeType': instance.$type,
    };
