import 'package:equatable/equatable.dart';

class Starship with EquatableMixin {
  Starship({
    this.mglt,
    this.cargoCapacity,
    this.consumables,
    this.costInCredits,
    this.created,
    this.crew,
    this.edited,
    this.hyperdriveRating,
    this.length,
    this.manufacturer,
    this.maxAtmospheringSpeed,
    this.model,
    this.name,
    this.passengers,
    this.films,
    this.pilots,
    this.starshipClass,
    this.url,
  });

  final String? mglt;
  final String? cargoCapacity;
  final String? consumables;
  final String? costInCredits;
  final String? created;
  final String? crew;
  final String? edited;
  final String? hyperdriveRating;
  final String? length;
  final String? manufacturer;
  final String? maxAtmospheringSpeed;
  final String? model;
  final String? name;
  final String? passengers;
  final List<String>? films;
  final List<String>? pilots;
  final String? starshipClass;
  final String? url;

  @override
  List<Object?> get props => [
        mglt,
        cargoCapacity,
        consumables,
        costInCredits,
        created,
        crew,
        edited,
        hyperdriveRating,
        length,
        manufacturer,
        maxAtmospheringSpeed,
        model,
        name,
        passengers,
        films,
        pilots,
        starshipClass,
        url,
      ];
}
