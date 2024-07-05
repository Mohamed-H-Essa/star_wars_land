import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';

part 'character_page_state.dart';

class CharacterPageCubit extends Cubit<CharacterPageState> {
  CharacterPageCubit({
    required GetAllPeople getAllCharacters,
  })  : _getAllCharacters = getAllCharacters,
        super(const CharacterPageState());

  final GetAllPeople _getAllCharacters;

  Future<void> fetchNextPage() async {
    if (state.hasReachedEnd) return;

    emit(state.copyWith(status: CharacterPageStatus.loading));

    final list = await _getAllCharacters(page: state.currentPage);

    emit(
      state.copyWith(
        status: CharacterPageStatus.success,
        hasReachedEnd: list.isEmpty,
        currentPage: state.currentPage + 1,
        characters: List.of(state.characters)..addAll(list),
      ),
    );
  }
}
