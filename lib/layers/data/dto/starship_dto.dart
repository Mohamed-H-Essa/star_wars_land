import 'dart:convert';
import 'package:starwars/layers/domain/entity/starship.dart';

class StarshipDto extends Starship {
  StarshipDto({
    super.mglt,
    super.cargoCapacity,
    super.consumables,
    super.costInCredits,
    super.created,
    super.crew,
    super.edited,
    super.hyperdriveRating,
    super.length,
    super.manufacturer,
    super.maxAtmospheringSpeed,
    super.model,
    super.name,
    super.passengers,
    super.films,
    super.pilots,
    super.starshipClass,
    super.url,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory StarshipDto.fromRawJson(String str) =>
      StarshipDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory StarshipDto.fromMap(Map<String, dynamic> json) => StarshipDto(
        mglt: json['MGLT'],
        cargoCapacity: json['cargo_capacity'],
        consumables: json['consumables'],
        costInCredits: json['cost_in_credits'],
        created: json['created'],
        crew: json['crew'],
        edited: json['edited'],
        hyperdriveRating: json['hyperdrive_rating'],
        length: json['length'],
        manufacturer: json['manufacturer'],
        maxAtmospheringSpeed: json['max_atmosphering_speed'],
        model: json['model'],
        name: json['name'],
        passengers: json['passengers'],
        films: List<String>.from(json['films'].map((x) => x)),
        pilots: List<String>.from(json['pilots'].map((x) => x)),
        starshipClass: json['starship_class'],
        url: json['url'],
      );

  Map<String, dynamic> toMap() => {
        'MGLT': mglt,
        'cargo_capacity': cargoCapacity,
        'consumables': consumables,
        'cost_in_credits': costInCredits,
        'created': created,
        'crew': crew,
        'edited': edited,
        'hyperdrive_rating': hyperdriveRating,
        'length': length,
        'manufacturer': manufacturer,
        'max_atmosphering_speed': maxAtmospheringSpeed,
        'model': model,
        'name': name,
        'passengers': passengers,
        'films': List<dynamic>.from(films!.map((x) => x)),
        'pilots': List<dynamic>.from(pilots!.map((x) => x)),
        'starship_class': starshipClass,
        'url': url,
      };
}
