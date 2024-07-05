import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/layers/domain/entity/person.dart';

part 'character_details_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  CharacterDetailsCubit({
    required Person character,
  }) : super(CharacterDetailsState(character));
}
