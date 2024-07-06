part of 'specie_page_bloc.dart';

enum SpeciePageStatus { initial, loading, success, failure }

class SpeciePageState extends Equatable {
  const SpeciePageState({
    this.status = SpeciePageStatus.initial,
    this.species = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
    this.searchQuery = '',
  });

  final SpeciePageStatus status;
  final List<Specie> species;
  final bool hasReachedEnd;
  final int currentPage;
  final String searchQuery;

  SpeciePageState copyWith({
    SpeciePageStatus? status,
    List<Specie>? species,
    bool? hasReachedEnd,
    int? currentPage,
    String? searchQuery,
  }) {
    return SpeciePageState(
      status: status ?? this.status,
      species: species ?? this.species,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object> get props => [
        status,
        species,
        hasReachedEnd,
        currentPage,
        searchQuery,
      ];
}
