import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/presentation/shared/person_list_item.dart';
import 'package:starwars/layers/presentation/using_bloc/list_page/bloc/person_page_bloc.dart';
import 'package:starwars/layers/presentation/using_bloc/list_page/view/person_page.dart';

import '../../../../../../fixtures/fixtures.dart';
import '../../../helper/pump_app.dart';

class PersonBlocMock extends MockBloc<PersonPageEvent, PersonPageState>
    implements PersonPageBloc {}

void main() {
  group('PersonPage', () {
    late GetAllPeopleMock getAllPeopleMock;
    late PersonPageBloc blocMock;

    setUp(() {
      getAllPeopleMock = GetAllPeopleMock();
      blocMock = PersonBlocMock();

      when(() => getAllPeopleMock.call(page: any(named: 'page')))
          .thenAnswer((_) async => [...personList1, ...personList2]);
    });

    testWidgets('renders PersonView', (tester) async {
      try {
        await tester.pumpApp(
          const PersonPage(),
          getAllPeople: getAllPeopleMock,
        );
        await tester.pumpAndSettle();
      } catch (e) {
        // https://stackoverflow.com/questions/64231515/widget-test-testing-a-button-with-circularprogressindicator
      }

      expectLater(find.byType(PersonView), findsOneWidget);
    });

    testWidgets('renders a grid of People widgets', (tester) async {
      const key = Key('person_page_list_key');
      when(() => blocMock.state).thenReturn(
        PersonPageState(
          currentPage: 2,
          status: PersonPageStatus.success,
          hasReachedEnd: false,
          people: [...personList1, ...personList2],
        ),
      );

      await tester.pumpApp(
        BlocProvider.value(
          value: blocMock,
          child: const PersonView(),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      final list = [...personList1, ...personList2];
      expectLater(find.byType(PersonListItem), findsNWidgets(list.length));
    });
  });
}
