import 'dart:convert';
import 'package:rickmorty/layers/domain/entity/person.dart';

class PersonDto extends Person {
  PersonDto({
    super.id,
    super.birthYear,
    super.eyeColor,
    super.films,
    super.gender,
    super.hairColor,
    super.height,
    super.homeworld,
    super.mass,
    super.name,
    super.skinColor,
    super.species,
    super.starships,
    super.url,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory PersonDto.fromRawJson(String str) =>
      PersonDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory PersonDto.fromMap(Map<String, dynamic> json) => PersonDto(
        id: json['id'],
        birthYear: json['birth_year'],
        eyeColor: json['eye_color'],
        films: List<String>.from(json['films'].map((x) => x)),
        gender: json['gender'],
        hairColor: json['hair_color'],
        height: json['height'],
        homeworld: json['homeworld'],
        mass: json['mass'],
        name: json['name'],
        skinColor: json['skin_color'],
        species: List<String>.from(json['species'].map((x) => x)),
        starships: List<String>.from(json['starships'].map((x) => x)),
        url: json['url'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'birth_year': birthYear,
        'eye_color': eyeColor,
        'films': List<dynamic>.from(films!.map((x) => x)),
        'gender': gender,
        'hair_color': hairColor,
        'height': height,
        'homeworld': homeworld,
        'mass': mass,
        'name': name,
        'skin_color': skinColor,
        'species': List<dynamic>.from(species!.map((x) => x)),
        'starships': List<dynamic>.from(starships!.map((x) => x)),
        'url': url,
      };
}
