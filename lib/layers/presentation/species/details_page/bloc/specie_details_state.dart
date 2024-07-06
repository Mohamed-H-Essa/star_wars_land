part of 'specie_details_bloc.dart';

class StarshipDetailsState with EquatableMixin {
  StarshipDetailsState({required this.starship});

  final Starship starship;

  @override
  List<Object?> get props => [starship];
}
