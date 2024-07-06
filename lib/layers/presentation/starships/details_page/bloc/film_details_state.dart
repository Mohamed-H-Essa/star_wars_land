part of 'film_details_bloc.dart';

class StarshipDetailsState with EquatableMixin {
  StarshipDetailsState({required this.film});

  final Starship film;

  @override
  List<Object?> get props => [film];
}
