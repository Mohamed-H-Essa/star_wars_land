import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/layers/domain/entity/film.dart';
import 'package:starwars/layers/domain/usecase/get_all_films.dart';
import 'package:starwars/layers/presentation/material_app.dart';
import 'package:starwars/layers/presentation/shared/list_item_header.dart';
import 'package:starwars/layers/presentation/shared/list_item_loading.dart';
import 'package:starwars/layers/presentation/films/details_page/view/film_details_page.dart';
import 'package:starwars/layers/presentation/films/list_page/bloc/film_page_bloc.dart';
import 'package:starwars/layers/presentation/films/shared/film_list_item.dart';
import 'package:starwars/layers/presentation/shared/presentation/search_field.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class FilmPage extends StatelessWidget {
  const FilmPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) {
        return const FilmPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilmPageBloc(
        getAllFilm: context.read<GetAllFilms>(),
      )..add(const FetchNextPageEvent()),
      child: Builder(
        builder: (context) {
          return MaterialAppK(body: FilmView());
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class FilmView extends StatelessWidget {
  const FilmView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((FilmPageBloc b) => b.state.status);
    return status == FilmPageStatus.initial
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

  FilmPageBloc get pageBloc => context.read<FilmPageBloc>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext ctx) {
    final l = ctx.select((FilmPageBloc b) => b.state.films);
    final query = ctx.select((FilmPageBloc b) => b.state.searchQuery);
    final list = FilmPageBloc.searchFilm(l, query);
    final hasEnded = ctx.select((FilmPageBloc b) => b.state.hasReachedEnd);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          SearchField(onChanged: (v) {
            context.read<FilmPageBloc>().add(SearchInputPageEvent(v));
          }),
          Expanded(
            child: ListView.builder(
              key: const ValueKey('film_page_list_key'),
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
                          const ListItemHeader(titleText: 'All Films'),
                          FilmListItem(item: item, onTap: _goToDetails),
                        ],
                      )
                    : FilmListItem(item: item, onTap: _goToDetails);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _goToDetails(Film film) {
    final route = FilmDetailsPage.route(film: film);
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
