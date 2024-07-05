import 'dart:convert';
import 'package:rickmorty/layers/domain/entity/vehicle.dart';

class VehicleDto extends Vehicle {
  VehicleDto({
    super.cargoCapacity,
    super.consumables,
    super.costInCredits,
    super.created,
    super.crew,
    super.edited,
    super.length,
    super.manufacturer,
    super.maxAtmospheringSpeed,
    super.model,
    super.name,
    super.passengers,
    super.films,
    super.pilots,
    super.vehicleClass,
    super.url,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory VehicleDto.fromRawJson(String str) =>
      VehicleDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory VehicleDto.fromMap(Map<String, dynamic> json) => VehicleDto(
        cargoCapacity: json['cargo_capacity'],
        consumables: json['consumables'],
        costInCredits: json['cost_in_credits'],
        created: json['created'],
        crew: json['crew'],
        edited: json['edited'],
        length: json['length'],
        manufacturer: json['manufacturer'],
        maxAtmospheringSpeed: json['max_atmosphering_speed'],
        model: json['model'],
        name: json['name'],
        passengers: json['passengers'],
        films: List<String>.from(json['films'].map((x) => x)),
        pilots: List<String>.from(json['pilots'].map((x) => x)),
        vehicleClass: json['vehicle_class'],
        url: json['url'],
      );

  Map<String, dynamic> toMap() => {
        'cargo_capacity': cargoCapacity,
        'consumables': consumables,
        'cost_in_credits': costInCredits,
        'created': created,
        'crew': crew,
        'edited': edited,
        'length': length,
        'manufacturer': manufacturer,
        'max_atmosphering_speed': maxAtmospheringSpeed,
        'model': model,
        'name': name,
        'passengers': passengers,
        'films': List<dynamic>.from(films!.map((x) => x)),
        'pilots': List<dynamic>.from(pilots!.map((x) => x)),
        'vehicle_class': vehicleClass,
        'url': url,
      };
}
