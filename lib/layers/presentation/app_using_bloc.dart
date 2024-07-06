import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/layers/domain/usecase/get_all_films.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';
import 'package:starwars/layers/domain/usecase/get_all_planets.dart';
import 'package:starwars/layers/domain/usecase/get_all_species.dart';
import 'package:starwars/layers/domain/usecase/get_all_starships.dart';
import 'package:starwars/layers/domain/usecase/get_all_vehicles.dart';
import 'package:starwars/layers/presentation/material_app.dart';
import 'package:starwars/layers/presentation/people/list_page/view/person_page.dart';
import 'package:starwars/layers/presentation/vehicles/list_page/view/vehicle_page.dart';

class AppUsingBloc extends StatelessWidget {
  const AppUsingBloc({
    super.key,
    required this.getAllPeople,
    required this.getAllFilms,
    required this.getAllPlanets,
    required this.getAllSpecies,
    required this.getAllStarships,
    required this.getAllVehicles,
  });

  final GetAllPeople getAllPeople;
  final GetAllFilms getAllFilms;
  final GetAllPlanets getAllPlanets;
  final GetAllSpecies getAllSpecies;
  final GetAllStarships getAllStarships;
  final GetAllVehicles getAllVehicles;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: getAllPeople),
        RepositoryProvider.value(value: getAllFilms),
        RepositoryProvider.value(value: getAllPlanets),
        RepositoryProvider.value(value: getAllSpecies),
        RepositoryProvider.value(value: getAllStarships),
        RepositoryProvider.value(value: getAllVehicles),
      ],
      // child: const AppView(),
      child: PersonPage(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PersonPage();
    return const VehiclePage();
  }
}
