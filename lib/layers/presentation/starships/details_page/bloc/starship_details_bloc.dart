import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starwars/layers/domain/entity/starship.dart';

part 'starship_details_event.dart';

part 'starship_details_state.dart';

class StarshipDetailsBloc
    extends Bloc<StarshipDetailsEvent, StarshipDetailsState> {
  StarshipDetailsBloc({required Starship starship})
      : super(StarshipDetailsState(starship: starship));
}
