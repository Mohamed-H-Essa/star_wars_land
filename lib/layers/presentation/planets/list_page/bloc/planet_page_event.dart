part of 'planet_page_bloc.dart';

sealed class PlanetPageEvent extends Equatable {
  const PlanetPageEvent();

  @override
  List<Object?> get props => [];
}

final class FetchNextPageEvent extends PlanetPageEvent {
  const FetchNextPageEvent();
}

final class SearchInputPageEvent extends PlanetPageEvent {
  const SearchInputPageEvent(this.query);
  final String query;
}
