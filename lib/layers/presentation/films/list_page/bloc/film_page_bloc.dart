import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/layers/domain/entity/film.dart';
import 'package:starwars/layers/domain/usecase/get_all_films.dart';
import 'package:stream_transform/stream_transform.dart';

part 'film_page_event.dart';
part 'film_page_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class FilmPageBloc extends Bloc<FilmPageEvent, FilmPageState> {
  FilmPageBloc({
    required GetAllFilms getAllFilm,
  })  : _getAllFilm = getAllFilm,
        super(const FilmPageState()) {
    on<FetchNextPageEvent>(
      _fetchNextPage,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
    on<SearchInputPageEvent>(
      _searchInput,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  final GetAllFilms _getAllFilm;

  Future<void> _fetchNextPage(event, Emitter<FilmPageState> emit) async {
    if (state.hasReachedEnd) return;

    emit(state.copyWith(status: FilmPageStatus.loading));

    final list = await _getAllFilm(page: state.currentPage);

    emit(
      state.copyWith(
        status: FilmPageStatus.success,
        films: List.of(state.films)..addAll(list),
        hasReachedEnd: list.isEmpty,
        currentPage: state.currentPage + 1,
      ),
    );
  }

  FutureOr<void> _searchInput(
    SearchInputPageEvent event,
    Emitter<FilmPageState> emit,
  ) {
    emit(
      state.copyWith(
        searchQuery: event.query,
      ),
    );
  }

  static List<Film> searchFilm(List<Film> people, String query) {
    final lowerCaseQuery = query.toLowerCase();
    return people.where((film) {
      final lowerCaseName = film.title.toString().toLowerCase();
      return lowerCaseName.contains(lowerCaseQuery);
    }).toList();
  }
}
