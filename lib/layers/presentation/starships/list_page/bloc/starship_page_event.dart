part of 'starship_page_bloc.dart';

sealed class StarshipPageEvent extends Equatable {
  const StarshipPageEvent();

  @override
  List<Object?> get props => [];
}

final class FetchNextPageEvent extends StarshipPageEvent {
  const FetchNextPageEvent();
}

final class SearchInputPageEvent extends StarshipPageEvent {
  const SearchInputPageEvent(this.query);
  final String query;
}
