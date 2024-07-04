import 'package:equatable/equatable.dart';
import 'package:rickmorty/layers/domain/entity/film.dart';
import 'package:rickmorty/layers/domain/entity/species.dart';
import 'package:rickmorty/layers/domain/entity/starship.dart';

class Person with EquatableMixin {
  Person({
    this.id,
    this.birthYear,
    this.eyeColor,
    this.films,
    this.gender,
    this.hairColor,
    this.height,
    this.homeworld,
    this.mass,
    this.name,
    this.skinColor,
    this.species,
    this.starships,
    this.url,
  });

  final int? id;
  final String? birthYear;
  final String? eyeColor;
  final List<String>? films;
  final String? gender;
  final String? hairColor;
  final String? height;
  final String? homeworld;
  final String? mass;
  final String? name;
  final String? skinColor;
  final List<String>? species;
  final List<String>? starships;
  final String? url;

  @override
  List<Object?> get props => [
        id,
        birthYear,
        eyeColor,
        films,
        gender,
        hairColor,
        height,
        homeworld,
        mass,
        name,
        skinColor,
        species,
        starships,
        url,
      ];
}
