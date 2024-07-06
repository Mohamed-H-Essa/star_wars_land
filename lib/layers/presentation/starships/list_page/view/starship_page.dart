import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/layers/domain/entity/starship.dart';
import 'package:starwars/layers/domain/usecase/get_all_starships.dart';
import 'package:starwars/layers/presentation/material_app.dart';
import 'package:starwars/layers/presentation/shared/list_item_header.dart';
import 'package:starwars/layers/presentation/shared/list_item_loading.dart';
import 'package:starwars/layers/presentation/shared/presentation/search_field.dart';
import 'package:starwars/layers/presentation/starships/details_page/view/starship_details_page.dart';
import 'package:starwars/layers/presentation/starships/list_page/bloc/starship_page_bloc.dart';
import 'package:starwars/layers/presentation/starships/shared/starship_list_item.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class StarshipPage extends StatelessWidget {
  const StarshipPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) {
        return const StarshipPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StarshipPageBloc(
        getAllStarship: context.read<GetAllStarships>(),
      )..add(const FetchNextPageEvent()),
      child: Builder(
        builder: (context) {
          return MaterialAppK(body: StarshipView());
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class StarshipView extends StatelessWidget {
  const StarshipView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((StarshipPageBloc b) => b.state.status);
    return status == StarshipPageStatus.initial
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

  StarshipPageBloc get pageBloc => context.read<StarshipPageBloc>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext ctx) {
    final l = ctx.select((StarshipPageBloc b) => b.state.starships);
    final query = ctx.select((StarshipPageBloc b) => b.state.searchQuery);
    final list = StarshipPageBloc.searchStarship(l, query);
    final hasEnded = ctx.select((StarshipPageBloc b) => b.state.hasReachedEnd);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          SearchField(onChanged: (v) {
            context.read<StarshipPageBloc>().add(SearchInputPageEvent(v));
          }),
          Expanded(
            child: ListView.builder(
              key: const ValueKey('starship_page_list_key'),
              controller: _scrollController,
              itemCount: hasEnded ? list.length : list.length + 1,
              itemBuilder: (context, index) {
                if (index >= list.length) {
                  return !hasEnded && query.isEmpty
                      ? const ListItemLoading()
                      : const SizedBox();
                }
                final item = list[index];
                return index == 0
                    ? Column(
                        children: [
                          const ListItemHeader(titleText: 'All Starships'),
                          StarshipListItem(item: item, onTap: _goToDetails),
                        ],
                      )
                    : StarshipListItem(item: item, onTap: _goToDetails);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _goToDetails(Starship starship) {
    final route = StarshipDetailsPage.route(starship: starship);
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
