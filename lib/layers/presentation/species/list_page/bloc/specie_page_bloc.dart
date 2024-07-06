import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/layers/domain/entity/specie.dart';
import 'package:starwars/layers/domain/usecase/get_all_species.dart';
import 'package:stream_transform/stream_transform.dart';

part 'specie_page_event.dart';
part 'specie_page_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class SpeciePageBloc extends Bloc<SpeciePageEvent, SpeciePageState> {
  SpeciePageBloc({
    required GetAllSpecies getAllSpecie,
  })  : _getAllSpecie = getAllSpecie,
        super(const SpeciePageState()) {
    on<FetchNextPageEvent>(
      _fetchNextPage,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  final GetAllSpecies _getAllSpecie;

  Future<void> _fetchNextPage(event, Emitter<SpeciePageState> emit) async {
    if (state.hasReachedEnd) return;

    emit(state.copyWith(status: SpeciePageStatus.loading));

    final list = await _getAllSpecie(page: state.currentPage);

    emit(
      state.copyWith(
        status: SpeciePageStatus.success,
        species: List.of(state.species)..addAll(list),
        hasReachedEnd: list.isEmpty,
        currentPage: state.currentPage + 1,
      ),
    );
  }
}
