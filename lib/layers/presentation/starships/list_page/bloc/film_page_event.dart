part of 'film_page_bloc.dart';

sealed class StarshipPageEvent extends Equatable {
  const StarshipPageEvent();

  @override
  List<Object?> get props => [];
}

final class FetchNextPageEvent extends StarshipPageEvent {
  const FetchNextPageEvent();
}
