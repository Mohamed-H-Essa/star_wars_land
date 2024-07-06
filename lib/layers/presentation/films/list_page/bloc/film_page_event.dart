part of 'film_page_bloc.dart';

sealed class FilmPageEvent extends Equatable {
  const FilmPageEvent();

  @override
  List<Object?> get props => [];
}

final class FetchNextPageEvent extends FilmPageEvent {
  const FetchNextPageEvent();
}
