import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/presentation/people/shared/person_list_item.dart';
import 'package:starwars/layers/presentation/using_cubit/list_page/cubit/person_page_cubit.dart';
import 'package:starwars/layers/presentation/using_cubit/list_page/view/person_page.dart';

import '../../../../../../fixtures/fixtures.dart';
import '../../../helper/pump_app.dart';

class PersonPageCubitMock extends MockCubit<PersonPageState>
    implements PersonPageCubit {}

void main() {
  group('PersonPage', () {
    late GetAllPeopleMock getAllPeopleMock;
    late PersonPageCubit cubit;

    setUp(() {
      getAllPeopleMock = GetAllPeopleMock();
      cubit = PersonPageCubitMock();

      when(() => getAllPeopleMock.call(page: any(named: 'page')))
          .thenAnswer((_) async => [...personList1, ...personList2]);
    });

    testWidgets('renders a PersonView', (tester) async {
      when(() => getAllPeopleMock(page: any(named: 'page'))).thenAnswer(
        (_) async => personList1,
      );

      await tester.pumpApp(
        const PersonPage(),
        getAllPeople: getAllPeopleMock,
      );

      expect(find.byType(PersonView), findsOneWidget);
    });

    testWidgets('renders a list of People widgets', (tester) async {
      const key = Key('person_page_list_key');
      when(() => cubit.state).thenReturn(
        PersonPageState(
          currentPage: 2,
          status: PersonPageStatus.success,
          hasReachedEnd: true,
          people: [...personList1, ...personList2],
        ),
      );
      when(() => cubit.fetchNextPage()).thenAnswer((_) async => true);

      await tester.pumpApp(
        BlocProvider.value(
          value: cubit,
          child: const PersonView(),
        ),
        getAllPeople: getAllPeopleMock,
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(key), findsOneWidget);
      final list = [...personList1, ...personList2];
      expectLater(find.byType(PersonListItem), findsNWidgets(list.length));
    });
  });
}
