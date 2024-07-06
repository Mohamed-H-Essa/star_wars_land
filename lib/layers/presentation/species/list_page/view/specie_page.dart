import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/layers/domain/entity/specie.dart';
import 'package:starwars/layers/domain/usecase/get_all_species.dart';
import 'package:starwars/layers/presentation/material_app.dart';
import 'package:starwars/layers/presentation/shared/list_item_header.dart';
import 'package:starwars/layers/presentation/shared/list_item_loading.dart';
import 'package:starwars/layers/presentation/species/details_page/view/specie_details_page.dart';
import 'package:starwars/layers/presentation/species/list_page/bloc/specie_page_bloc.dart';
import 'package:starwars/layers/presentation/species/shared/specie_list_item.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class SpeciePage extends StatelessWidget {
  const SpeciePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) {
        return const SpeciePage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpeciePageBloc(
        getAllSpecie: context.read<GetAllSpecies>(),
      )..add(const FetchNextPageEvent()),
      child: Builder(
        builder: (context) {
          return MaterialAppK(body: SpecieView());
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class SpecieView extends StatelessWidget {
  const SpecieView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((SpeciePageBloc b) => b.state.status);
    return status == SpeciePageStatus.initial
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

  SpeciePageBloc get pageBloc => context.read<SpeciePageBloc>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext ctx) {
    final list = ctx.select((SpeciePageBloc b) => b.state.species);
    final hasEnded = ctx.select((SpeciePageBloc b) => b.state.hasReachedEnd);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListView.builder(
        key: const ValueKey('specie_page_list_key'),
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
                    const ListItemHeader(titleText: 'All Species'),
                    SpecieListItem(item: item, onTap: _goToDetails),
                  ],
                )
              : SpecieListItem(item: item, onTap: _goToDetails);
        },
      ),
    );
  }

  void _goToDetails(Specie specie) {
    final route = SpecieDetailsPage.route(specie: specie);
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
