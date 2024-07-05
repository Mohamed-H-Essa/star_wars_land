import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/presentation/using_provider/list_page/change_notifier/person_page_change_notifier.dart';

import '../../../../../../fixtures/fixtures.dart';
import '../../../helper/pump_app.dart';

void main() {
  group('PersonChangeNotifier', () {
    late GetAllPeopleMock getAllPeopleMock;
    late PersonPageChangeNotifier personChangeNotifier;

    setUp(() {
      getAllPeopleMock = GetAllPeopleMock();
    });

    test('fetchNextPage updates state correctly', () async {
      personChangeNotifier = PersonPageChangeNotifier(
        getAllPeople: getAllPeopleMock,
      );

      when(() => getAllPeopleMock.call(page: any(named: 'page')))
          .thenAnswer((_) async => [...personList1, ...personList2]);

      // Set up the initial state
      expect(
        personChangeNotifier.status,
        equals(PersonPageStatus.initial),
      );

      // Set up the response from getAllPeople
      final page = personChangeNotifier.currentPage;

      await personChangeNotifier.fetchNextPage();

      // Verify that the state is updated correctly
      expect(
        personChangeNotifier.status,
        equals(PersonPageStatus.success),
      );
      expect(personChangeNotifier.currentPage, equals(page + 1));
      expect(
        personChangeNotifier.people,
        equals([
          ...[...personList1, ...personList2],
        ]),
      );
      expect(personChangeNotifier.hasReachedEnd, equals(false));
    });

    test('fetchNextPage does not update state when hasReachedEnd is true',
        () async {
      // Set up the initial state with hasReachedEnd = true
      personChangeNotifier = PersonPageChangeNotifier(
        getAllPeople: getAllPeopleMock,
      );

      when(() => getAllPeopleMock.call(page: any(named: 'page')))
          .thenAnswer((_) async => []);

      // Call the fetchNextPage method
      await personChangeNotifier.fetchNextPage();

      // Verify that the state remains unchanged
      expect(
        personChangeNotifier.status,
        equals(PersonPageStatus.success),
      );
      expect(personChangeNotifier.currentPage, equals(2));
      expect(personChangeNotifier.people, isEmpty);
      expect(personChangeNotifier.hasReachedEnd, equals(true));
    });
  });
}
