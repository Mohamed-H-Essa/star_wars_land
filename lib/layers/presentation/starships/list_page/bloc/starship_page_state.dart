part of 'starship_page_bloc.dart';

enum StarshipPageStatus { initial, loading, success, failure }

class StarshipPageState extends Equatable {
  const StarshipPageState({
    this.status = StarshipPageStatus.initial,
    this.starships = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
    this.searchQuery = '',
  });

  final StarshipPageStatus status;
  final List<Starship> starships;
  final bool hasReachedEnd;
  final int currentPage;
  final String searchQuery;

  StarshipPageState copyWith({
    StarshipPageStatus? status,
    List<Starship>? starships,
    bool? hasReachedEnd,
    int? currentPage,
    String? searchQuery,
  }) {
    return StarshipPageState(
      status: status ?? this.status,
      starships: starships ?? this.starships,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object> get props => [
        status,
        starships,
        hasReachedEnd,
        currentPage,
        searchQuery,
      ];
}
