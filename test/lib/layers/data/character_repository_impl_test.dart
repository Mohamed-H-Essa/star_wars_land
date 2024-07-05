import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/data/starwars_repository_impl.dart';
import 'package:starwars/layers/data/source/local/local_storage.dart';
import 'package:starwars/layers/data/source/network/api.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixtures.dart';

class MockApi extends Mock implements Api {}

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  late StarwarsRepositoryImpl starwarsRepository;
  late MockApi mockApi;
  late MockLocalStorage mockLocalStorage;

  setUp(() {
    mockApi = MockApi();
    mockLocalStorage = MockLocalStorage();
    starwarsRepository = StarwarsRepositoryImpl(
      api: mockApi,
      localStorage: mockLocalStorage,
    );
  });

  group('PeopleRepositoryImpl', () {
    test('getPeople should return cached people if available', () async {
      const page = 0;
      final cachedPeople = personList1;
      when(() => mockLocalStorage.loadPeoplePage(page: page))
          .thenReturn(cachedPeople);

      final result = await starwarsRepository.getPeople(page: page);

      expect(result, equals(cachedPeople));

      verify(() => mockLocalStorage.loadPeoplePage(page: page)).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyZeroInteractions(mockApi);
    });

    test('getPeople should fetch people from API and save to local storage',
        () async {
      const page = 1;
      final apiPeople = personList2;
      when(() => mockLocalStorage.loadPeoplePage(page: page)).thenReturn([]);
      when(() => mockApi.loadPeople(page: page))
          .thenAnswer((_) async => apiPeople);
      when(
        () => mockLocalStorage.savePeoplePage(
          page: page,
          list: apiPeople,
        ),
      ).thenAnswer((_) async => true);

      final result = await starwarsRepository.getPeople(page: page);

      expect(result, equals(apiPeople));
      verify(() => mockLocalStorage.loadPeoplePage(page: page)).called(1);
      verify(() => mockApi.loadPeople(page: page)).called(1);
      verify(
        () => mockLocalStorage.savePeoplePage(
          page: page,
          list: apiPeople,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyNoMoreInteractions(mockApi);
    });
  });

  group('FilmsRepositoryImpl', () {
    test('getFilms should return cached films if available', () async {
      const page = 0;
      final cachedFilms = filmList1;
      when(() => mockLocalStorage.loadFilmsPage(page: page))
          .thenReturn(cachedFilms);

      final result = await starwarsRepository.getFilms(page: page);

      expect(result, equals(cachedFilms));

      verify(() => mockLocalStorage.loadFilmsPage(page: page)).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyZeroInteractions(mockApi);
    });

    test('getFilms should fetch films from API and save to local storage',
        () async {
      const page = 1;
      final apiFilms = filmList2;
      when(() => mockLocalStorage.loadFilmsPage(page: page)).thenReturn([]);
      when(() => mockApi.loadFilms(page: page))
          .thenAnswer((_) async => apiFilms);
      when(
        () => mockLocalStorage.saveFilmsPage(
          page: page,
          list: apiFilms,
        ),
      ).thenAnswer((_) async => true);

      final result = await starwarsRepository.getFilms(page: page);

      expect(result, equals(apiFilms));
      verify(() => mockLocalStorage.loadFilmsPage(page: page)).called(1);
      verify(() => mockApi.loadFilms(page: page)).called(1);
      verify(
        () => mockLocalStorage.saveFilmsPage(
          page: page,
          list: apiFilms,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyNoMoreInteractions(mockApi);
    });
  });

  group('PlanetsRepositoryImpl', () {
    test('getPlanets should return cached planets if available', () async {
      const page = 0;
      final cachedPlanets = planetList1;
      when(() => mockLocalStorage.loadPlanetsPage(page: page))
          .thenReturn(cachedPlanets);

      final result = await starwarsRepository.getPlanets(page: page);

      expect(result, equals(cachedPlanets));

      verify(() => mockLocalStorage.loadPlanetsPage(page: page)).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyZeroInteractions(mockApi);
    });

    test('getPlanets should fetch planets from API and save to local storage',
        () async {
      const page = 1;
      final apiPlanets = planetList2;
      when(() => mockLocalStorage.loadPlanetsPage(page: page)).thenReturn([]);
      when(() => mockApi.loadPlanets(page: page))
          .thenAnswer((_) async => apiPlanets);
      when(
        () => mockLocalStorage.savePlanetsPage(
          page: page,
          list: apiPlanets,
        ),
      ).thenAnswer((_) async => true);

      final result = await starwarsRepository.getPlanets(page: page);

      expect(result, equals(apiPlanets));
      verify(() => mockLocalStorage.loadPlanetsPage(page: page)).called(1);
      verify(() => mockApi.loadPlanets(page: page)).called(1);
      verify(
        () => mockLocalStorage.savePlanetsPage(
          page: page,
          list: apiPlanets,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyNoMoreInteractions(mockApi);
    });
  });

  group('SpeciesRepositoryImpl', () {
    test('getSpecies should return cached species if available', () async {
      const page = 0;
      final cachedSpecies = specieList1;
      when(() => mockLocalStorage.loadSpeciesPage(page: page))
          .thenReturn(cachedSpecies);

      final result = await starwarsRepository.getSpecies(page: page);

      expect(result, equals(cachedSpecies));

      verify(() => mockLocalStorage.loadSpeciesPage(page: page)).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyZeroInteractions(mockApi);
    });

    test('getSpecies should fetch species from API and save to local storage',
        () async {
      const page = 1;
      final apiSpecies = specieList2;
      when(() => mockLocalStorage.loadSpeciesPage(page: page)).thenReturn([]);
      when(() => mockApi.loadSpecies(page: page))
          .thenAnswer((_) async => apiSpecies);
      when(
        () => mockLocalStorage.saveSpeciesPage(
          page: page,
          list: apiSpecies,
        ),
      ).thenAnswer((_) async => true);

      final result = await starwarsRepository.getSpecies(page: page);

      expect(result, equals(apiSpecies));
      verify(() => mockLocalStorage.loadSpeciesPage(page: page)).called(1);
      verify(() => mockApi.loadSpecies(page: page)).called(1);
      verify(
        () => mockLocalStorage.saveSpeciesPage(
          page: page,
          list: apiSpecies,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyNoMoreInteractions(mockApi);
    });
  });

  group('StarshipsRepositoryImpl', () {
    test('getStarships should return cached starships if available', () async {
      const page = 0;
      final cachedStarships = starshipList1;
      when(() => mockLocalStorage.loadStarshipsPage(page: page))
          .thenReturn(cachedStarships);

      final result = await starwarsRepository.getStarships(page: page);

      expect(result, equals(cachedStarships));

      verify(() => mockLocalStorage.loadStarshipsPage(page: page)).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyZeroInteractions(mockApi);
    });

    test(
        'getStarships should fetch starships from API and save to local storage',
        () async {
      const page = 1;
      final apiStarships = starshipList2;
      when(() => mockLocalStorage.loadStarshipsPage(page: page)).thenReturn([]);
      when(() => mockApi.loadStarships(page: page))
          .thenAnswer((_) async => apiStarships);
      when(
        () => mockLocalStorage.saveStarshipsPage(
          page: page,
          list: apiStarships,
        ),
      ).thenAnswer((_) async => true);

      final result = await starwarsRepository.getStarships(page: page);

      expect(result, equals(apiStarships));
      verify(() => mockLocalStorage.loadStarshipsPage(page: page)).called(1);
      verify(() => mockApi.loadStarships(page: page)).called(1);
      verify(
        () => mockLocalStorage.saveStarshipsPage(
          page: page,
          list: apiStarships,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyNoMoreInteractions(mockApi);
    });
  });

  group('VehiclesRepositoryImpl', () {
    test('getVehicles should return cached vehicles if available', () async {
      const page = 0;
      final cachedVehicles = vehicleList1;
      when(() => mockLocalStorage.loadVehiclesPage(page: page))
          .thenReturn(cachedVehicles);

      final result = await starwarsRepository.getVehicles(page: page);

      expect(result, equals(cachedVehicles));

      verify(() => mockLocalStorage.loadVehiclesPage(page: page)).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyZeroInteractions(mockApi);
    });

    test('getVehicles should fetch vehicles from API and save to local storage',
        () async {
      const page = 1;
      final apiVehicles = vehicleList2;
      when(() => mockLocalStorage.loadVehiclesPage(page: page)).thenReturn([]);
      when(() => mockApi.loadVehicles(page: page))
          .thenAnswer((_) async => apiVehicles);
      when(
        () => mockLocalStorage.saveVehiclesPage(
          page: page,
          list: apiVehicles,
        ),
      ).thenAnswer((_) async => true);

      final result = await starwarsRepository.getVehicles(page: page);

      expect(result, equals(apiVehicles));
      verify(() => mockLocalStorage.loadVehiclesPage(page: page)).called(1);
      verify(() => mockApi.loadVehicles(page: page)).called(1);
      verify(
        () => mockLocalStorage.saveVehiclesPage(
          page: page,
          list: apiVehicles,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyNoMoreInteractions(mockApi);
    });
  });
}
