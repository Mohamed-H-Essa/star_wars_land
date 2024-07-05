import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/presentation/using_get_it/list_page/controller/person_page_controller.dart';

import '../../../../../../fixtures/fixtures.dart';
import '../../../helper/pump_app.dart';

void main() {
  late PersonPageController controller;

  setUp(() {
    final mock = GetAllPeopleMock();
    when(() => mock.call(page: any(named: 'page')))
        .thenAnswer((_) async => [...personList1, ...personList2]);

    controller = PersonPageController(getAllPeople: mock);
  });

  group('.fetchNextPage()', () {
    test('updates status to loading and notifies listeners', () async {
      var loadingHappened = false;

      // the 'loading' state happens between the method call and the final
      // state. That's the reason we use a listener to be sure it happened
      controller.status.addListener(() {
        if (controller.status.value == PersonPageStatus.loading) {
          loadingHappened = true;
        }
      });

      expect(controller.status.value, PersonPageStatus.initial);
      await controller.fetchNextPage();
      expect(loadingHappened, true);
    });

    test('fetches people and updates state', () async {
      controller.currentPage.value = 1;

      await controller.fetchNextPage();

      expect(controller.currentPage.value, 2);
      expect(controller.status.value, PersonPageStatus.success);
      expect(controller.people.value, isNotEmpty);
      expect(controller.hasReachedEnd.value, isFalse);
    });

    test('fetchNextPage does not fetch if hasReachedEnd is true', () async {
      controller.hasReachedEnd.value = true;

      await controller.fetchNextPage();

      expect(controller.currentPage.value, 1);
      expect(controller.status.value, PersonPageStatus.initial);
      expect(controller.people.value, isEmpty);
    });
  });
}
