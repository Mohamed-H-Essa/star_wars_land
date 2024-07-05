import 'package:starwars/layers/data/source/local/local_storage.dart';
import 'package:starwars/layers/data/source/network/api.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/domain/entity/film.dart';
import 'package:starwars/layers/domain/entity/planet.dart';
import 'package:starwars/layers/domain/entity/specie.dart';
import 'package:starwars/layers/domain/entity/starship.dart';
import 'package:starwars/layers/domain/entity/vehicle.dart';
import 'package:starwars/layers/domain/repository/starwars_repository.dart';

class StarwarsRepositoryImpl implements StarwarsRepository {
  final Api _api;
  final LocalStorage _localStorage;

  StarwarsRepositoryImpl({
    required Api api,
    required LocalStorage localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  @override
  Future<List<Person>> getPeople({int page = 0}) async {
    print('Getting people from page $page');
    final cachedList = _localStorage.loadPeoplePage(page: page);
    if (cachedList.isNotEmpty) {
      return cachedList;
    }

    final fetchedList = await _api.loadPeople(page: page);
    await _localStorage.savePeoplePage(page: page, list: fetchedList);
    return fetchedList;
  }

  @override
  Future<List<Film>> getFilms({int page = 0}) async {
    final cachedList = _localStorage.loadFilmsPage(page: page);
    if (cachedList.isNotEmpty) {
      return cachedList;
    }

    final fetchedList = await _api.loadFilms(page: page);
    await _localStorage.saveFilmsPage(page: page, list: fetchedList);
    return fetchedList;
  }

  @override
  Future<List<Planet>> getPlanets({int page = 0}) async {
    final cachedList = _localStorage.loadPlanetsPage(page: page);
    if (cachedList.isNotEmpty) {
      return cachedList;
    }

    final fetchedList = await _api.loadPlanets(page: page);
    await _localStorage.savePlanetsPage(page: page, list: fetchedList);
    return fetchedList;
  }

  @override
  Future<List<Specie>> getSpecies({int page = 0}) async {
    final cachedList = _localStorage.loadSpeciesPage(page: page);
    if (cachedList.isNotEmpty) {
      return cachedList;
    }

    final fetchedList = await _api.loadSpecies(page: page);
    await _localStorage.saveSpeciesPage(page: page, list: fetchedList);
    return fetchedList;
  }

  @override
  Future<List<Starship>> getStarships({int page = 0}) async {
    final cachedList = _localStorage.loadStarshipsPage(page: page);
    if (cachedList.isNotEmpty) {
      return cachedList;
    }

    final fetchedList = await _api.loadStarships(page: page);
    await _localStorage.saveStarshipsPage(page: page, list: fetchedList);
    return fetchedList;
  }

  @override
  Future<List<Vehicle>> getVehicles({int page = 0}) async {
    final cachedList = _localStorage.loadVehiclesPage(page: page);
    if (cachedList.isNotEmpty) {
      return cachedList;
    }

    final fetchedList = await _api.loadVehicles(page: page);
    await _localStorage.saveVehiclesPage(page: page, list: fetchedList);
    return fetchedList;
  }
}
