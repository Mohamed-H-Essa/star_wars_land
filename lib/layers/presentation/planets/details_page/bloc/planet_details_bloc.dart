import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starwars/layers/domain/entity/planet.dart';

part 'planet_details_event.dart';

part 'planet_details_state.dart';

class PlanetDetailsBloc extends Bloc<PlanetDetailsEvent, PlanetDetailsState> {
  PlanetDetailsBloc({required Planet planet})
      : super(PlanetDetailsState(planet: planet));
}
