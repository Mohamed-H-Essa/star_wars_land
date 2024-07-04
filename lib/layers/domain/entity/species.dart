import 'package:equatable/equatable.dart';

class Species with EquatableMixin {
  Species({
    this.averageHeight,
    this.averageLifespan,
    this.classification,
    this.created,
    this.designation,
    this.edited,
    this.eyeColors,
    this.hairColors,
    this.homeworld,
    this.language,
    this.name,
    this.people,
    this.films,
    this.skinColors,
    this.url,
  });

  final String? averageHeight;
  final String? averageLifespan;
  final String? classification;
  final String? created;
  final String? designation;
  final String? edited;
  final String? eyeColors;
  final String? hairColors;
  final String? homeworld;
  final String? language;
  final String? name;
  final List<String>? people;
  final List<String>? films;
  final String? skinColors;
  final String? url;

  @override
  List<Object?> get props => [
        averageHeight,
        averageLifespan,
        classification,
        created,
        designation,
        edited,
        eyeColors,
        hairColors,
        homeworld,
        language,
        name,
        people,
        films,
        skinColors,
        url,
      ];
}
