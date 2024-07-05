import 'package:meta/meta.dart';
import 'package:starwars/layers/data/dto/film_dto.dart';
import 'package:starwars/layers/data/dto/person_dto.dart';
import 'package:starwars/layers/data/dto/starship_dto.dart';
import 'package:starwars/layers/data/dto/vehicle_dto.dart';
import 'package:starwars/layers/data/dto/species_dto.dart';
import 'package:starwars/layers/data/dto/planet_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedStarwarsListKey = "STARWARS_CACHED_LIST";

abstract class LocalStorage {
  Future<bool> savePeoplePage({
    required int page,
    required List<PersonDto> list,
  });
  List<PersonDto> loadPeoplePage({required int page});

  Future<bool> saveFilmsPage({
    required int page,
    required List<FilmDto> list,
  });
  List<FilmDto> loadFilmsPage({required int page});

  Future<bool> saveStarshipsPage({
    required int page,
    required List<StarshipDto> list,
  });
  List<StarshipDto> loadStarshipsPage({required int page});

  Future<bool> saveVehiclesPage({
    required int page,
    required List<VehicleDto> list,
  });
  List<VehicleDto> loadVehiclesPage({required int page});

  Future<bool> saveSpeciesPage({
    required int page,
    required List<SpeciesDto> list,
  });
  List<SpeciesDto> loadSpeciesPage({required int page});

  Future<bool> savePlanetsPage({
    required int page,
    required List<PlanetDto> list,
  });
  List<PlanetDto> loadPlanetsPage({required int page});
}

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _sharedPref;

  LocalStorageImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPref = sharedPreferences;

  @override
  List<PersonDto> loadPeoplePage({required int page}) {
    final key = getKeyToPage(page, 'people');
    final jsonList = _sharedPref.getStringList(key);

    return jsonList != null
        ? jsonList.map((e) => PersonDto.fromRawJson(e)).toList()
        : [];
  }

  @override
  Future<bool> savePeoplePage({
    required int page,
    required List<PersonDto> list,
  }) {
    final jsonList = list.map((e) => e.toRawJson()).toList();
    final key = getKeyToPage(page, 'people');
    return _sharedPref.setStringList(key, jsonList);
  }

  @override
  List<FilmDto> loadFilmsPage({required int page}) {
    final key = getKeyToPage(page, 'films');
    final jsonList = _sharedPref.getStringList(key);

    return jsonList != null
        ? jsonList.map((e) => FilmDto.fromRawJson(e)).toList()
        : [];
  }

  @override
  Future<bool> saveFilmsPage({
    required int page,
    required List<FilmDto> list,
  }) {
    final jsonList = list.map((e) => e.toRawJson()).toList();
    final key = getKeyToPage(page, 'films');
    return _sharedPref.setStringList(key, jsonList);
  }

  @override
  List<StarshipDto> loadStarshipsPage({required int page}) {
    final key = getKeyToPage(page, 'starships');
    final jsonList = _sharedPref.getStringList(key);

    return jsonList != null
        ? jsonList.map((e) => StarshipDto.fromRawJson(e)).toList()
        : [];
  }

  @override
  Future<bool> saveStarshipsPage({
    required int page,
    required List<StarshipDto> list,
  }) {
    final jsonList = list.map((e) => e.toRawJson()).toList();
    final key = getKeyToPage(page, 'starships');
    return _sharedPref.setStringList(key, jsonList);
  }

  @override
  List<VehicleDto> loadVehiclesPage({required int page}) {
    final key = getKeyToPage(page, 'vehicles');
    final jsonList = _sharedPref.getStringList(key);

    return jsonList != null
        ? jsonList.map((e) => VehicleDto.fromRawJson(e)).toList()
        : [];
  }

  @override
  Future<bool> saveVehiclesPage({
    required int page,
    required List<VehicleDto> list,
  }) {
    final jsonList = list.map((e) => e.toRawJson()).toList();
    final key = getKeyToPage(page, 'vehicles');
    return _sharedPref.setStringList(key, jsonList);
  }

  @override
  List<SpeciesDto> loadSpeciesPage({required int page}) {
    final key = getKeyToPage(page, 'species');
    final jsonList = _sharedPref.getStringList(key);

    return jsonList != null
        ? jsonList.map((e) => SpeciesDto.fromRawJson(e)).toList()
        : [];
  }

  @override
  Future<bool> saveSpeciesPage({
    required int page,
    required List<SpeciesDto> list,
  }) {
    final jsonList = list.map((e) => e.toRawJson()).toList();
    final key = getKeyToPage(page, 'species');
    return _sharedPref.setStringList(key, jsonList);
  }

  @override
  List<PlanetDto> loadPlanetsPage({required int page}) {
    final key = getKeyToPage(page, 'planets');
    final jsonList = _sharedPref.getStringList(key);

    return jsonList != null
        ? jsonList.map((e) => PlanetDto.fromRawJson(e)).toList()
        : [];
  }

  @override
  Future<bool> savePlanetsPage({
    required int page,
    required List<PlanetDto> list,
  }) {
    final jsonList = list.map((e) => e.toRawJson()).toList();
    final key = getKeyToPage(page, 'planets');
    return _sharedPref.setStringList(key, jsonList);
  }

  @visibleForTesting
  static String getKeyToPage(int page, String entityType) {
    return '${cachedStarwarsListKey}_${entityType}_$page';
  }
}
