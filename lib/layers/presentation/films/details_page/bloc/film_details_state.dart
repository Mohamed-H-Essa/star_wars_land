part of 'film_details_bloc.dart';

class FilmDetailsState with EquatableMixin {
  FilmDetailsState({required this.film});

  final Film film;

  @override
  List<Object?> get props => [film];
}
