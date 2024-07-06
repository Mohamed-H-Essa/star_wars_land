part of 'planet_page_bloc.dart';

enum PlanetPageStatus { initial, loading, success, failure }

class PlanetPageState extends Equatable {
  const PlanetPageState({
    this.status = PlanetPageStatus.initial,
    this.planets = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
    this.searchQuery = '',
  });

  final PlanetPageStatus status;
  final List<Planet> planets;
  final bool hasReachedEnd;
  final int currentPage;
  final String searchQuery;

  PlanetPageState copyWith({
    PlanetPageStatus? status,
    List<Planet>? planets,
    bool? hasReachedEnd,
    int? currentPage,
    String? searchQuery,
  }) {
    return PlanetPageState(
      status: status ?? this.status,
      planets: planets ?? this.planets,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object> get props => [
        status,
        planets,
        hasReachedEnd,
        currentPage,
        searchQuery,
      ];
}
