// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Events _$EventsFromJson(Map<String, dynamic> json) => Events(
      description: json['description'] as String,
      eventType: json['event-type'] as String,
      formLink: json['form-link'] as String,
      id: json['id'] as int,
      location: json['Location'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
      'id': instance.id,
      'Location': instance.location,
      'event-type': instance.eventType,
      'title': instance.title,
      'form-link': instance.formLink,
      'description': instance.description,
    };
