part of 'vehicle_page_bloc.dart';

enum VehiclePageStatus { initial, loading, success, failure }

class VehiclePageState extends Equatable {
  const VehiclePageState({
    this.status = VehiclePageStatus.initial,
    this.vehicles = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
    this.searchQuery = '',
  });

  final VehiclePageStatus status;
  final List<Vehicle> vehicles;
  final bool hasReachedEnd;
  final int currentPage;
  final String searchQuery;

  VehiclePageState copyWith({
    VehiclePageStatus? status,
    List<Vehicle>? vehicles,
    bool? hasReachedEnd,
    int? currentPage,
    String? searchQuery,
  }) {
    return VehiclePageState(
      status: status ?? this.status,
      vehicles: vehicles ?? this.vehicles,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object> get props => [
        status,
        vehicles,
        hasReachedEnd,
        currentPage,
        searchQuery,
      ];
}
