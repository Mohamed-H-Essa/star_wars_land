import 'package:equatable/equatable.dart';

class Film with EquatableMixin {
  Film({
    this.people,
    this.created,
    this.director,
    this.edited,
    this.episodeId,
    this.openingCrawl,
    // this.planets,
    this.producer,
    this.releaseDate,
    // this.species,
    // this.starships,
    this.title,
    this.url,
    // this.vehicles,
  });

  final List<String>? people;
  final String? created;
  final String? director;
  final String? edited;
  final int? episodeId;
  final String? openingCrawl;
  // final List<String>? planets;
  final String? producer;
  final String? releaseDate;
  // final List<String>? species;
  // final List<String>? starships;
  final String? title;
  final String? url;
  // final List<String>? vehicles;

  @override
  List<Object?> get props => [
        people,
        created,
        director,
        edited,
        episodeId,
        openingCrawl,
        // planets,
        producer,
        releaseDate,
        // species,
        // starships,
        title,
        url,
        // vehicles,
      ];
}
