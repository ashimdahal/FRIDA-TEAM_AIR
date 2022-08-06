import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class News extends Equatable {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "author")
  final String author;

  const News(
      {required this.author,
      required this.description,
      required this.id,
      required this.title});

  @override
  List<Object?> get props => [id, title, description, author];

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
