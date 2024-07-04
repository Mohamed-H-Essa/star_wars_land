import 'package:equatable/equatable.dart';

class Vehicle with EquatableMixin {
  Vehicle({
    this.cargoCapacity,
    this.consumables,
    this.costInCredits,
    this.created,
    this.crew,
    this.edited,
    this.length,
    this.manufacturer,
    this.maxAtmospheringSpeed,
    this.model,
    this.name,
    this.passengers,
    this.films,
    this.pilots,
    this.vehicleClass,
    this.url,
  });

  final String? cargoCapacity;
  final String? consumables;
  final String? costInCredits;
  final String? created;
  final String? crew;
  final String? edited;
  final String? length;
  final String? manufacturer;
  final String? maxAtmospheringSpeed;
  final String? model;
  final String? name;
  final String? passengers;
  final List<String>? films;
  final List<String>? pilots;
  final String? vehicleClass;
  final String? url;

  @override
  List<Object?> get props => [
        cargoCapacity,
        consumables,
        costInCredits,
        created,
        crew,
        edited,
        length,
        manufacturer,
        maxAtmospheringSpeed,
        model,
        name,
        passengers,
        films,
        pilots,
        vehicleClass,
        url,
      ];
}
