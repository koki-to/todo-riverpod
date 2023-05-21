// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      id: json['id'] as String,
      content: json['content'] as String,
      createdAt:
          const DateTimeConverter().fromJson(json['created_at'] as String),
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'created_at': const DateTimeConverter().toJson(instance.createdAt),
    };
