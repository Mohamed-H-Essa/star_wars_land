part of 'planet_page_bloc.dart';

enum PlanetPageStatus { initial, loading, success, failure }

class PlanetPageState extends Equatable {
  const PlanetPageState({
    this.status = PlanetPageStatus.initial,
    this.planets = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
  });

  final PlanetPageStatus status;
  final List<Planet> planets;
  final bool hasReachedEnd;
  final int currentPage;

  PlanetPageState copyWith({
    PlanetPageStatus? status,
    List<Planet>? planets,
    bool? hasReachedEnd,
    int? currentPage,
  }) {
    return PlanetPageState(
      status: status ?? this.status,
      planets: planets ?? this.planets,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [
        status,
        planets,
        hasReachedEnd,
        currentPage,
      ];
}
