import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/domain/repository/person_repository.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';
import 'package:test/test.dart';

class MockPersonRepository extends Mock implements PersonRepository {}

void main() {
  late GetAllPeople getAllPeople;
  late MockPersonRepository mockPersonRepository;

  setUp(() {
    mockPersonRepository = MockPersonRepository();
    getAllPeople = GetAllPeople(repository: mockPersonRepository);
  });

  group('GetAllPeople', () {
    test('call should return a list of people', () async {
      const page = 0;
      final people = [
        Person(id: 1, name: 'Rick Sanchez'),
        Person(id: 2, name: 'Morty Smith'),
      ];

      when(() => mockPersonRepository.getPeople(page: page))
          .thenAnswer((_) async => people);

      final result = await getAllPeople.call(page: page);

      expect(result, equals(people));

      verify(() => mockPersonRepository.getPeople(page: page)).called(1);
      verifyNoMoreInteractions(mockPersonRepository);
    });
  });
}
