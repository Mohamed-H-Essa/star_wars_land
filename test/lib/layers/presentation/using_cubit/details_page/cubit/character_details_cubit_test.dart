import 'package:rickmorty/layers/domain/entity/people.dart';
import 'package:rickmorty/layers/presentation/using_cubit/details_page/cubit/character_details_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('CharacterDetailsCubit', () {
    test('it should have correct initial state', () {
      final character = Person(id: 1, name: 'Test Character');
      final cubit = CharacterDetailsCubit(character: character);
      final expected = CharacterDetailsState(character);
      expect(cubit.state, expected);
    });
  });
}
