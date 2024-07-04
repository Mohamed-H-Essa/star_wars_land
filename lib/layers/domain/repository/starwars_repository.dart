import 'package:rickmorty/layers/domain/entity/film.dart';
import 'package:rickmorty/layers/domain/entity/person.dart';
import 'package:rickmorty/layers/domain/entity/planet.dart';
import 'package:rickmorty/layers/domain/entity/species.dart';
import 'package:rickmorty/layers/domain/entity/starship.dart';
import 'package:rickmorty/layers/domain/entity/vehicle.dart';

abstract class StarwarsRepository {
  Future<List<Person>> getPeople({int page = 0});
  Future<List<Film>> getFilms({int page = 0});
  Future<List<Planet>> getPlanets({int page = 0});
  Future<List<Species>> getSpecies({int page = 0});
  Future<List<Starship>> getStarships({int page = 0});
  Future<List<Vehicle>> getVehicles({int page = 0});
}
