part of 'planet_details_bloc.dart';

class PlanetDetailsState with EquatableMixin {
  PlanetDetailsState({required this.planet});

  final Planet planet;

  @override
  List<Object?> get props => [planet];
}
