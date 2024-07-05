import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/data/starwars_repository_impl.dart';
import 'package:starwars/layers/data/source/local/local_storage.dart';
import 'package:starwars/layers/data/source/network/api.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixtures.dart';

class MockApi extends Mock implements Api {}

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  late StarwarsRepositoryImpl characterRepository;
  late MockApi mockApi;
  late MockLocalStorage mockLocalStorage;

  setUp(() {
    mockApi = MockApi();
    mockLocalStorage = MockLocalStorage();
    characterRepository = StarwarsRepositoryImpl(
      api: mockApi,
      localStorage: mockLocalStorage,
    );
  });

  group('CharacterRepositoryImpl', () {
    test('getCharacters should return cached characters if available',
        () async {
      const page = 0;
      final cachedCharacters = characterList1;
      when(() => mockLocalStorage.loadPeoplePage(page: page))
          .thenReturn(cachedCharacters);

      final result = await characterRepository.getCharacters(page: page);

      expect(result, equals(cachedCharacters));

      verify(() => mockLocalStorage.loadPeoplePage(page: page)).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyZeroInteractions(mockApi);
    });

    test(
        'getCharacters should fetch characters from API and save to local storage',
        () async {
      const page = 1;
      final apiCharacters = characterList2;
      when(() => mockLocalStorage.loadPeoplePage(page: page)).thenReturn([]);
      when(() => mockApi.loadCharacters(page: page))
          .thenAnswer((_) async => apiCharacters);
      when(
        () => mockLocalStorage.savePeoplePage(
          page: page,
          list: apiCharacters,
        ),
      ).thenAnswer((_) async => true);

      final result = await characterRepository.getCharacters(page: page);

      expect(result, equals(apiCharacters));
      verify(() => mockLocalStorage.loadPeoplePage(page: page)).called(1);
      verify(() => mockApi.loadCharacters(page: page)).called(1);
      verify(
        () => mockLocalStorage.savePeoplePage(
          page: page,
          list: apiCharacters,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyNoMoreInteractions(mockApi);
    });
  });
}
