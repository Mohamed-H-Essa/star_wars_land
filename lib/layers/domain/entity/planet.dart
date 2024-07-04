import 'package:equatable/equatable.dart';

class Planet with EquatableMixin {
  Planet({
    this.climate,
    this.created,
    this.diameter,
    this.edited,
    this.films,
    this.gravity,
    this.name,
    this.orbitalPeriod,
    this.population,
    this.residents,
    this.rotationPeriod,
    this.surfaceWater,
    this.terrain,
    this.url,
  });

  final String? climate;
  final String? created;
  final String? diameter;
  final String? edited;
  final List<String>? films;
  final String? gravity;
  final String? name;
  final String? orbitalPeriod;
  final String? population;
  final List<String>? residents;
  final String? rotationPeriod;
  final String? surfaceWater;
  final String? terrain;
  final String? url;

  @override
  List<Object?> get props => [
        climate,
        created,
        diameter,
        edited,
        films,
        gravity,
        name,
        orbitalPeriod,
        population,
        residents,
        rotationPeriod,
        surfaceWater,
        terrain,
        url,
      ];
}
