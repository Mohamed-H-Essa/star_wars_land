import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/layers/domain/entity/planet.dart';
import 'package:starwars/layers/domain/usecase/get_all_planets.dart';
import 'package:stream_transform/stream_transform.dart';

part 'planet_page_event.dart';
part 'planet_page_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PlanetPageBloc extends Bloc<PlanetPageEvent, PlanetPageState> {
  PlanetPageBloc({
    required GetAllPlanets getAllPlanet,
  })  : _getAllPlanet = getAllPlanet,
        super(const PlanetPageState()) {
    on<FetchNextPageEvent>(
      _fetchNextPage,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  final GetAllPlanets _getAllPlanet;

  Future<void> _fetchNextPage(event, Emitter<PlanetPageState> emit) async {
    if (state.hasReachedEnd) return;

    emit(state.copyWith(status: PlanetPageStatus.loading));

    final list = await _getAllPlanet(page: state.currentPage);

    emit(
      state.copyWith(
        status: PlanetPageStatus.success,
        planets: List.of(state.planets)..addAll(list),
        hasReachedEnd: list.isEmpty,
        currentPage: state.currentPage + 1,
      ),
    );
  }
}
