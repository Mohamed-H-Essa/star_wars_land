import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/presentation/using_cubit/list_page/cubit/person_page_cubit.dart';

import '../../../../../../fixtures/fixtures.dart';
import '../../../helper/pump_app.dart';

void main() {
  group('PersonPageCubit', () {
    late GetAllPeopleMock getAllPeopleMock;
    late PersonPageCubit cubit;

    setUp(() {
      getAllPeopleMock = GetAllPeopleMock();
      cubit = PersonPageCubit(getAllPeople: getAllPeopleMock);
    });

    test('should have correct initial state', () {
      const expected = PersonPageState(
        people: [],
        currentPage: 1,
        status: PersonPageStatus.initial,
        hasReachedEnd: false,
      );

      expect(
        PersonPageCubit(getAllPeople: getAllPeopleMock).state,
        expected,
      );
    });

    group('.fetchNextPage()', () {
      blocTest<PersonPageCubit, PersonPageState>(
        'emits loading -> runs UseCase -> emits success with a list',
        build: () => cubit,
        setUp: () {
          when(() => getAllPeopleMock(page: 1)).thenAnswer(
            (_) async => personList1,
          );
        },
        act: (cubit) => cubit.fetchNextPage(),
        expect: () => [
          const PersonPageState(
            status: PersonPageStatus.loading,
          ),
          PersonPageState(
            status: PersonPageStatus.success,
            people: personList1,
            hasReachedEnd: false,
            currentPage: 2,
          ),
        ],
        verify: (_) {
          verify(() => getAllPeopleMock.call(page: 1));
          verifyNoMoreInteractions(getAllPeopleMock);
        },
      );

      blocTest<PersonPageCubit, PersonPageState>(
        "emits a state with hasReachedEnd 'true' when there are no more items",
        build: () => cubit,
        setUp: () {
          when(() => getAllPeopleMock(page: 1)).thenAnswer((_) async => []);
        },
        act: (cubit) => cubit.fetchNextPage(),
        skip: 1, // skip 'loading'
        expect: () => [
          const PersonPageState(
            status: PersonPageStatus.success,
            people: [],
            hasReachedEnd: true,
            currentPage: 2,
          ),
        ],
      );
    });
  });
}
