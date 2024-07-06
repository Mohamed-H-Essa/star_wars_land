import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/layers/domain/entity/vehicle.dart';
import 'package:starwars/layers/domain/usecase/get_all_vehicles.dart';
import 'package:stream_transform/stream_transform.dart';

part 'vehicle_page_event.dart';
part 'vehicle_page_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class VehiclePageBloc extends Bloc<VehiclePageEvent, VehiclePageState> {
  VehiclePageBloc({
    required GetAllVehicles getAllVehicle,
  })  : _getAllVehicle = getAllVehicle,
        super(const VehiclePageState()) {
    on<FetchNextPageEvent>(
      _fetchNextPage,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
    on<SearchInputPageEvent>(
      _searchInput,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  final GetAllVehicles _getAllVehicle;

  Future<void> _fetchNextPage(event, Emitter<VehiclePageState> emit) async {
    if (state.hasReachedEnd) return;

    emit(state.copyWith(status: VehiclePageStatus.loading));

    final list = await _getAllVehicle(page: state.currentPage);

    emit(
      state.copyWith(
        status: VehiclePageStatus.success,
        vehicles: List.of(state.vehicles)..addAll(list),
        hasReachedEnd: list.isEmpty,
        currentPage: state.currentPage + 1,
      ),
    );
  }

  FutureOr<void> _searchInput(
    SearchInputPageEvent event,
    Emitter<VehiclePageState> emit,
  ) {
    emit(
      state.copyWith(
        searchQuery: event.query,
      ),
    );
  }

  static List<Vehicle> searchVehicle(List<Vehicle> people, String query) {
    final lowerCaseQuery = query.toLowerCase();
    return people.where((film) {
      final lowerCaseName = film.name.toString().toLowerCase();
      return lowerCaseName.contains(lowerCaseQuery);
    }).toList();
  }
}
