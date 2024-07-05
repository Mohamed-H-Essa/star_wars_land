import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';
import 'package:starwars/layers/presentation/list_page/view/person_page.dart';

class AppUsingBloc extends StatelessWidget {
  const AppUsingBloc({super.key, required this.getAllPeople});

  final GetAllPeople getAllPeople;

  @override
  Widget build(BuildContext context) {
    // 1 - Inject all uses cases on the top of the widget's tree
    // 2 - Use them as BLOC/Cubit dependencies as needed
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: getAllPeople),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PersonPage();
  }
}