import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:starwars/layers/data/source/local/local_storage.dart';
import 'package:starwars/layers/data/source/network/api.dart';
import 'package:starwars/layers/data/starwars_repository_impl.dart';
import 'package:starwars/layers/domain/usecase/get_all_films.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';
import 'package:starwars/layers/domain/usecase/get_all_planets.dart';
import 'package:starwars/layers/domain/usecase/get_all_species.dart';
import 'package:starwars/layers/domain/usecase/get_all_starships.dart';
import 'package:starwars/layers/domain/usecase/get_all_vehicles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starwars/layers/presentation/app_using_bloc.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  Animate.restartOnHotReload = true;

  final api = ApiImpl();
  final localStorage = LocalStorageImpl(sharedPreferences: sharedPref);
  final repo = StarwarsRepositoryImpl(api: api, localStorage: localStorage);

  final getAllPeople = GetAllPeople(repository: repo);
  final getAllFilms = GetAllFilms(repository: repo);
  final getAllPlanets = GetAllPlanets(repository: repo);
  final getAllSpecies = GetAllSpecies(repository: repo);
  final getAllStarships = GetAllStarships(repository: repo);
  final getAllVehicles = GetAllVehicles(repository: repo);
  runApp(
    AppUsingBloc(
      getAllPeople: getAllPeople,
      getAllFilms: getAllFilms,
      getAllPlanets: getAllPlanets,
      getAllSpecies: getAllSpecies,
      getAllStarships: getAllStarships,
      getAllVehicles: getAllVehicles,
    ),
  );
}
