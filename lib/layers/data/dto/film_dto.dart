import 'dart:convert';
import 'package:rickmorty/layers/domain/entity/film.dart';

class FilmDto extends Film {
  FilmDto({
    super.characters,
    super.created,
    super.director,
    super.edited,
    super.episodeId,
    super.openingCrawl,
    super.planets,
    super.producer,
    super.releaseDate,
    super.species,
    super.starships,
    super.title,
    super.url,
    super.vehicles,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory FilmDto.fromRawJson(String str) => FilmDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory FilmDto.fromMap(Map<String, dynamic> json) => FilmDto(
        characters: List<String>.from(json['characters'].map((x) => x)),
        created: json['created'],
        director: json['director'],
        edited: json['edited'],
        episodeId: json['episode_id'],
        openingCrawl: json['opening_crawl'],
        planets: List<String>.from(json['planets'].map((x) => x)),
        producer: json['producer'],
        releaseDate: json['release_date'],
        species: List<String>.from(json['species'].map((x) => x)),
        starships: List<String>.from(json['starships'].map((x) => x)),
        title: json['title'],
        url: json['url'],
        vehicles: List<String>.from(json['vehicles'].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        'characters': List<dynamic>.from(characters!.map((x) => x)),
        'created': created,
        'director': director,
        'edited': edited,
        'episode_id': episodeId,
        'opening_crawl': openingCrawl,
        'planets': List<dynamic>.from(planets!.map((x) => x)),
        'producer': producer,
        'release_date': releaseDate,
        'species': List<dynamic>.from(species!.map((x) => x)),
        'starships': List<dynamic>.from(starships!.map((x) => x)),
        'title': title,
        'url': url,
        'vehicles': List<dynamic>.from(vehicles!.map((x) => x)),
      };
}
