import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/presentation/people/shared/person_list_item.dart';
import 'package:starwars/layers/presentation/using_provider/list_page/view/person_page.dart';

import '../../../../../../fixtures/fixtures.dart';
import '../../../helper/pump_app.dart';

void main() {
  group('PersonPage', () {
    late GetAllPeopleMock getAllPeopleMock;

    setUp(() async {
      getAllPeopleMock = GetAllPeopleMock();
      when(() => getAllPeopleMock.call(page: any(named: 'page')))
          .thenAnswer((_) async => [...personList1, ...personList2]);
    });

    testWidgets('renders a PersonView', (tester) async {
      await tester.pumpApp(
        const PersonPage(),
        getAllPeople: getAllPeopleMock,
      );

      expect(find.byType(PersonView), findsOneWidget);
    });

    testWidgets('renders a list of People widgets', (tester) async {
      const key = Key('person_page_list_key');

      try {
        await tester.pumpApp(
          const PersonPage(),
          getAllPeople: getAllPeopleMock,
        );

        await tester.pumpAndSettle();
      } catch (e) {
        // ignore loading at the bottom
      }

      expect(find.byKey(key), findsOneWidget);
      expectLater(
        find.byType(PersonListItem),
        findsNWidgets([...personList1, ...personList2].length),
      );
    });
  });
}
