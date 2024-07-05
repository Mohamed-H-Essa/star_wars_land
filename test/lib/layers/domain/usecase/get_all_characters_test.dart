import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/domain/repository/character_repository.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';
import 'package:test/test.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

void main() {
  late GetAllPeople getAllCharacters;
  late MockCharacterRepository mockCharacterRepository;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getAllCharacters = GetAllPeople(repository: mockCharacterRepository);
  });

  group('GetAllCharacters', () {
    test('call should return a list of characters', () async {
      const page = 0;
      final characters = [
        Person(id: 1, name: 'Rick Sanchez'),
        Person(id: 2, name: 'Morty Smith'),
      ];

      when(() => mockCharacterRepository.getCharacters(page: page))
          .thenAnswer((_) async => characters);

      final result = await getAllCharacters.call(page: page);

      expect(result, equals(characters));

      verify(() => mockCharacterRepository.getCharacters(page: page)).called(1);
      verifyNoMoreInteractions(mockCharacterRepository);
    });
  });
}
