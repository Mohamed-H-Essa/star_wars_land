import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';
import 'package:starwars/layers/domain/usecase/get_all_vehicles.dart';
import 'package:starwars/layers/presentation/people/details_page/view/person_details_page.dart';
import 'package:starwars/layers/presentation/people/list_page/bloc/person_page_bloc.dart';
import 'package:starwars/layers/presentation/people/shared/person_list_item.dart';
import 'package:starwars/layers/presentation/shared/list_item_header.dart';
import 'package:starwars/layers/presentation/vehicles/list_page/view/vehicle_page.dart';

import '../../../shared/list_item_loading.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) {
        return const PersonPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonPageBloc(
        getAllPeople: context.read<GetAllPeople>(),
      )..add(const FetchNextPageEvent()),
      child: const PersonView(),
    );
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class PersonView extends StatelessWidget {
  const PersonView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((PersonPageBloc b) => b.state.status);
    return status == PersonPageStatus.initial
        ? const Center(child: CircularProgressIndicator())
        : const _Content();
  }
}

// -----------------------------------------------------------------------------
// Content
// -----------------------------------------------------------------------------
class _Content extends StatefulWidget {
  const _Content({super.key});

  @override
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  final _scrollController = ScrollController();

  PersonPageBloc get pageBloc => context.read<PersonPageBloc>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext ctx) {
    final list = ctx.select((PersonPageBloc b) => b.state.people);
    final hasEnded = ctx.select((PersonPageBloc b) => b.state.hasReachedEnd);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListView.builder(
        key: const ValueKey('person_page_list_key'),
        controller: _scrollController,
        itemCount: hasEnded ? list.length : list.length + 1,
        itemBuilder: (context, index) {
          if (index >= list.length) {
            return !hasEnded ? const ListItemLoading() : const SizedBox();
          }
          final item = list[index];
          return index == 0
              ? Column(
                  children: [
                    TextButton(
                        onPressed: () async {
                          final res =
                              await context.read<GetAllVehicles>().call();
                          print(res);
                          Navigator.of(context)
                              .push<void>(VehiclePage.route(context));
                        },
                        child: Text('from person page nav')),
                    const ListItemHeader(titleText: 'All People'),
                    PersonListItem(item: item, onTap: _goToDetails),
                  ],
                )
              : PersonListItem(item: item, onTap: _goToDetails);
        },
      ),
    );
  }

  void _goToDetails(Person person) {
    final route = PersonDetailsPage.route(person: person);
    Navigator.of(context).push(route);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      pageBloc.add(const FetchNextPageEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
