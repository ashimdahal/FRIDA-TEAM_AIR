import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'events_model.g.dart';

@JsonSerializable()
class Events extends Equatable {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "Location")
  final String location;
  @JsonKey(name: "event-type")
  final String eventType;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "form-link")
  final String formLink;
  @JsonKey(name: "description")
  final String description;

  const Events(
      {required this.description,
      required this.eventType,
      required this.formLink,
      required this.id,
      required this.location,
      required this.title});

  @override
  List<Object?> get props =>
      [id, location, eventType, title, formLink, description];

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);
  Map<String, dynamic> toJson() => _$EventsToJson(this);
}
