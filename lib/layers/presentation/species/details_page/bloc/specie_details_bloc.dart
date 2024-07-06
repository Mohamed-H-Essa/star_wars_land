import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starwars/layers/domain/entity/specie.dart';

part 'specie_details_event.dart';

part 'specie_details_state.dart';

class SpecieDetailsBloc extends Bloc<SpecieDetailsEvent, SpecieDetailsState> {
  SpecieDetailsBloc({required Specie specie})
      : super(SpecieDetailsState(specie: specie));
}
