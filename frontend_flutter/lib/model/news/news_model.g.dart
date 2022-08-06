// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      author: json['author'] as String,
      description: json['description'] as String,
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'author': instance.author,
    };
