import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';
import 'package:stream_transform/stream_transform.dart';

part 'person_page_event.dart';
part 'person_page_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PersonPageBloc extends Bloc<PersonPageEvent, PersonPageState> {
  PersonPageBloc({
    required GetAllPeople getAllPeople,
  })  : _getAllPeople = getAllPeople,
        super(const PersonPageState()) {
    on<FetchNextPageEvent>(
      _fetchNextPage,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
    on<SearchInputPageEvent>(
      _searchInput,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  final GetAllPeople _getAllPeople;

  Future<void> _fetchNextPage(event, Emitter<PersonPageState> emit) async {
    if (state.hasReachedEnd) return;

    emit(state.copyWith(status: PersonPageStatus.loading));

    final list = await _getAllPeople(page: state.currentPage);

    emit(
      state.copyWith(
        status: PersonPageStatus.success,
        people: _searchPeople(List.of(state.people)..addAll(list), 'Luke'),
        hasReachedEnd: list.isEmpty,
        currentPage: state.currentPage + 1,
      ),
    );
  }

  FutureOr<void> _searchInput(
    SearchInputPageEvent event,
    Emitter<PersonPageState> emit,
  ) {
    emit(
      state.copyWith(
        searchQuery: event.query,
        people: _searchPeople(state.people, event.query),
      ),
    );
  }

  List<Person> _searchPeople(List<Person> people, String query) {
    final lowerCaseQuery = query.toLowerCase();
    return people.where((person) {
      final lowerCaseName = person.name.toString().toLowerCase();
      return lowerCaseName.contains(lowerCaseQuery);
    }).toList();
  }
}
