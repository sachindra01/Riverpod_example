// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map<String, dynamic> json) {
  return _$_Post(
    id: json['id'] as int?,
    userId: json['userId'] as int?,
    title: json['title'] as String?,
    body: json['body'] as String?,
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'body': instance.body,
    };

_$_Album _$_$_AlbumFromJson(Map<String, dynamic> json) {
  return _$_Album(
    id: json['id'] as int?,
    userId: json['userId'] as int?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$_$_AlbumToJson(_$_Album instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
    };
