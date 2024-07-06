part of 'film_page_bloc.dart';

enum FilmPageStatus { initial, loading, success, failure }

class FilmPageState extends Equatable {
  const FilmPageState({
    this.status = FilmPageStatus.initial,
    this.films = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
    this.searchQuery = '',
  });

  final FilmPageStatus status;
  final List<Film> films;
  final bool hasReachedEnd;
  final int currentPage;
  final String searchQuery;

  FilmPageState copyWith({
    FilmPageStatus? status,
    List<Film>? films,
    bool? hasReachedEnd,
    int? currentPage,
    String? searchQuery,
  }) {
    return FilmPageState(
      status: status ?? this.status,
      films: films ?? this.films,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object> get props => [
        status,
        films,
        hasReachedEnd,
        currentPage,
      ];
}
