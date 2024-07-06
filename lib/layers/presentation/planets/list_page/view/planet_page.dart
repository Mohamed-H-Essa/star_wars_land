import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/layers/domain/entity/planet.dart';
import 'package:starwars/layers/domain/usecase/get_all_planets.dart';
import 'package:starwars/layers/presentation/material_app.dart';
import 'package:starwars/layers/presentation/shared/list_item_header.dart';
import 'package:starwars/layers/presentation/shared/list_item_loading.dart';
import 'package:starwars/layers/presentation/planets/details_page/view/planet_details_page.dart';
import 'package:starwars/layers/presentation/planets/list_page/bloc/planet_page_bloc.dart';
import 'package:starwars/layers/presentation/planets/shared/planet_list_item.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class PlanetPage extends StatelessWidget {
  const PlanetPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) {
        return const PlanetPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanetPageBloc(
        getAllPlanet: context.read<GetAllPlanets>(),
      )..add(const FetchNextPageEvent()),
      child: Builder(
        builder: (context) {
          return MaterialAppK(body: PlanetView());
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class PlanetView extends StatelessWidget {
  const PlanetView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((PlanetPageBloc b) => b.state.status);
    return status == PlanetPageStatus.initial
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

  PlanetPageBloc get pageBloc => context.read<PlanetPageBloc>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext ctx) {
    final list = ctx.select((PlanetPageBloc b) => b.state.planets);
    final hasEnded = ctx.select((PlanetPageBloc b) => b.state.hasReachedEnd);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListView.builder(
        key: const ValueKey('planet_page_list_key'),
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
                    const ListItemHeader(titleText: 'All Planets'),
                    PlanetListItem(item: item, onTap: _goToDetails),
                  ],
                )
              : PlanetListItem(item: item, onTap: _goToDetails);
        },
      ),
    );
  }

  void _goToDetails(Planet planet) {
    final route = PlanetDetailsPage.route(planet: planet);
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
