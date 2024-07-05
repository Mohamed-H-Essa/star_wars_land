import 'dart:convert';
import 'package:starwars/layers/domain/entity/specie.dart';

class SpecieDto extends Specie {
  SpecieDto({
    super.averageHeight,
    super.averageLifespan,
    super.classification,
    super.created,
    super.designation,
    super.edited,
    super.eyeColors,
    super.hairColors,
    super.homeworld,
    super.language,
    super.name,
    super.people,
    super.films,
    super.skinColors,
    super.url,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory SpecieDto.fromRawJson(String str) =>
      SpecieDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory SpecieDto.fromMap(Map<String, dynamic> json) => SpecieDto(
        averageHeight: json['average_height'],
        averageLifespan: json['average_lifespan'],
        classification: json['classification'],
        created: json['created'],
        designation: json['designation'],
        edited: json['edited'],
        eyeColors: json['eye_colors'],
        hairColors: json['hair_colors'],
        homeworld: json['homeworld'],
        language: json['language'],
        name: json['name'],
        people: List<String>.from(json['people'].map((x) => x)),
        films: List<String>.from(json['films'].map((x) => x)),
        skinColors: json['skin_colors'],
        url: json['url'],
      );

  Map<String, dynamic> toMap() => {
        'average_height': averageHeight,
        'average_lifespan': averageLifespan,
        'classification': classification,
        'created': created,
        'designation': designation,
        'edited': edited,
        'eye_colors': eyeColors,
        'hair_colors': hairColors,
        'homeworld': homeworld,
        'language': language,
        'name': name,
        'people': List<dynamic>.from(people!.map((x) => x)),
        'films': List<dynamic>.from(films!.map((x) => x)),
        'skin_colors': skinColors,
        'url': url,
      };
}