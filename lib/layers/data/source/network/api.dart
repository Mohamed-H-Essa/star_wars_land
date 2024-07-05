// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:starwars/layers/data/dto/person_dto.dart';
import 'package:starwars/layers/data/dto/film_dto.dart';
import 'package:starwars/layers/data/dto/planet_dto.dart';
import 'package:starwars/layers/data/dto/specie_dto.dart';
import 'package:starwars/layers/data/dto/starship_dto.dart';
import 'package:starwars/layers/data/dto/vehicle_dto.dart';

const baseUrl = 'https://swapi.dev/api';

abstract class Api {
  Future<List<PersonDto>> loadPeople({int page = 0});
  Future<List<FilmDto>> loadFilms({int page = 0});
  Future<List<PlanetDto>> loadPlanets({int page = 0});
  Future<List<SpecieDto>> loadSpecies({int page = 0});
  Future<List<StarshipDto>> loadStarships({int page = 0});
  Future<List<VehicleDto>> loadVehicles({int page = 0});
}

class ApiImpl implements Api {
  final dio = Dio();

  @override
  Future<List<PersonDto>> loadPeople({int page = 0}) async {
    return _loadEntities<PersonDto>(
      'people',
      page,
      (data) => PersonDto.fromMap(data),
    );
  }

  @override
  Future<List<FilmDto>> loadFilms({int page = 0}) async {
    return _loadEntities<FilmDto>(
      'films',
      page,
      (data) => FilmDto.fromMap(data),
    );
  }

  @override
  Future<List<PlanetDto>> loadPlanets({int page = 0}) async {
    return _loadEntities<PlanetDto>(
      'planets',
      page,
      (data) => PlanetDto.fromMap(data),
    );
  }

  @override
  Future<List<SpecieDto>> loadSpecies({int page = 0}) async {
    return _loadEntities<SpecieDto>(
      'species',
      page,
      (data) => SpecieDto.fromMap(data),
    );
  }

  @override
  Future<List<StarshipDto>> loadStarships({int page = 0}) async {
    return _loadEntities<StarshipDto>(
      'starships',
      page,
      (data) => StarshipDto.fromMap(data),
    );
  }

  @override
  Future<List<VehicleDto>> loadVehicles({int page = 0}) async {
    return _loadEntities<VehicleDto>(
      'vehicles',
      page,
      (data) => VehicleDto.fromMap(data),
    );
  }

  Future<List<T>> _loadEntities<T>(
    String endpoint,
    int page,
    T Function(Map<String, dynamic>) fromMap,
  ) async {
    try {
      final Response<Map<String, dynamic>> response =
          await dio.get('$baseUrl/$endpoint/?page=$page');
      print('page' + page.toString());
      final l = (response.data!['results'] as List<dynamic>)
          .map((e) => fromMap(e))
          .toList();
      return l;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return [];
      print('error retreiving');
      print(e);
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
        if (e.response?.statusCode == 404) return [];
      } else {
        print(e);
      }
    }
    return [];
  }
}
