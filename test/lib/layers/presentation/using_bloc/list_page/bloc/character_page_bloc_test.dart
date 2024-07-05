import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';
import 'package:starwars/layers/presentation/using_bloc/list_page/bloc/person_page_bloc.dart';

import '../../../../../../fixtures/fixtures.dart';

class MockGetAllPeople extends Mock implements GetAllPeople {}

void main() {
  late PersonPageBloc bloc;
  late GetAllPeople getAllPeople;

  setUp(() {
    getAllPeople = MockGetAllPeople();
    bloc = PersonPageBloc(getAllPeople: getAllPeople);
  });

  group('PersonPageBloc', () {
    test('initial state is correct', () {
      final initial = bloc.state;
      expect(initial, const PersonPageState());
    });

    group('.FetchNextPageEvent', () {
      blocTest<PersonPageBloc, PersonPageState>(
        'emits loading -> runs UseCase -> emits success with a list',
        build: () => bloc,
        setUp: () {
          when(() => getAllPeople(page: 1)).thenAnswer(
            (_) async => personList1,
          );
        },
        act: (bloc) => bloc..add(const FetchNextPageEvent()),
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
          verify(() => getAllPeople.call(page: 1));
          verifyNoMoreInteractions(getAllPeople);
        },
      );

      blocTest<PersonPageBloc, PersonPageState>(
        "emits a state with hasReachedEnd 'true' when there are no more items",
        build: () => bloc,
        setUp: () {
          when(() => getAllPeople(page: 1)).thenAnswer(
            (_) async => const [],
          );
        },
        skip: 1, // skip 'loading'
        act: (bloc) => bloc..add(const FetchNextPageEvent()),
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
