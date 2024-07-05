import 'dart:convert';
import 'package:rickmorty/layers/domain/entity/planet.dart';

class PlanetDto extends Planet {
  PlanetDto({
    super.climate,
    super.created,
    super.diameter,
    super.edited,
    super.films,
    super.gravity,
    super.name,
    super.orbitalPeriod,
    super.population,
    super.residents,
    super.rotationPeriod,
    super.surfaceWater,
    super.terrain,
    super.url,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory PlanetDto.fromRawJson(String str) =>
      PlanetDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory PlanetDto.fromMap(Map<String, dynamic> json) => PlanetDto(
        climate: json['climate'],
        created: json['created'],
        diameter: json['diameter'],
        edited: json['edited'],
        films: List<String>.from(json['films'].map((x) => x)),
        gravity: json['gravity'],
        name: json['name'],
        orbitalPeriod: json['orbital_period'],
        population: json['population'],
        residents: List<String>.from(json['residents'].map((x) => x)),
        rotationPeriod: json['rotation_period'],
        surfaceWater: json['surface_water'],
        terrain: json['terrain'],
        url: json['url'],
      );

  Map<String, dynamic> toMap() => {
        'climate': climate,
        'created': created,
        'diameter': diameter,
        'edited': edited,
        'films': List<dynamic>.from(films!.map((x) => x)),
        'gravity': gravity,
        'name': name,
        'orbital_period': orbitalPeriod,
        'population': population,
        'residents': List<dynamic>.from(residents!.map((x) => x)),
        'rotation_period': rotationPeriod,
        'surface_water': surfaceWater,
        'terrain': terrain,
        'url': url,
      };
}
