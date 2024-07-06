import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/layers/domain/entity/starship.dart';
import 'package:starwars/layers/domain/usecase/get_all_starships.dart';
import 'package:stream_transform/stream_transform.dart';

part 'starship_page_event.dart';
part 'starship_page_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class StarshipPageBloc extends Bloc<StarshipPageEvent, StarshipPageState> {
  StarshipPageBloc({
    required GetAllStarships getAllStarship,
  })  : _getAllStarship = getAllStarship,
        super(const StarshipPageState()) {
    on<FetchNextPageEvent>(
      _fetchNextPage,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
    on<SearchInputPageEvent>(
      _searchInput,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  final GetAllStarships _getAllStarship;

  Future<void> _fetchNextPage(event, Emitter<StarshipPageState> emit) async {
    if (state.hasReachedEnd) return;

    emit(state.copyWith(status: StarshipPageStatus.loading));

    final list = await _getAllStarship(page: state.currentPage);

    emit(
      state.copyWith(
        status: StarshipPageStatus.success,
        starships: List.of(state.starships)..addAll(list),
        hasReachedEnd: list.isEmpty,
        currentPage: state.currentPage + 1,
      ),
    );
  }

  FutureOr<void> _searchInput(
    SearchInputPageEvent event,
    Emitter<StarshipPageState> emit,
  ) {
    emit(
      state.copyWith(
        searchQuery: event.query,
      ),
    );
  }

  static List<Starship> searchPeople(List<Starship> people, String query) {
    final lowerCaseQuery = query.toLowerCase();
    return people.where((film) {
      final lowerCaseName = film.name.toString().toLowerCase();
      return lowerCaseName.contains(lowerCaseQuery);
    }).toList();
  }
}
