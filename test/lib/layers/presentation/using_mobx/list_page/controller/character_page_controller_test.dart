import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/presentation/using_mobx/list_page/store/person_page_store.dart';

import '../../../../../../fixtures/fixtures.dart';
import '../../../helper/pump_app.dart';

void main() {
  late PersonPageStore store;
  late GetAllPeopleMock getAllPeopleMock;

  setUp(() {
    getAllPeopleMock = GetAllPeopleMock();
    store = PersonPageStore(getAllPeople: getAllPeopleMock);
  });

  test('fetchNextPage success', () async {
    // Mock the response of GetAllPeople
    final mockPersonList = [...personList1, ...personList2];
    when(() => getAllPeopleMock.call(page: any(named: 'page')))
        .thenAnswer((_) async => mockPersonList);

    expect(store.contentStatus, equals(PersonPageStatus.initial));

    // Call the method under test
    await store.fetchNextPage();

    // Verify the interactions and expected values
    expect(store.contentStatus, equals(PersonPageStatus.success));
    expect(store.currentPage, equals(2));
    expect(store.peopleList, equals(mockPersonList));
    expect(store.hasReachedEnd, isFalse);
  });

  test('fetchNextPage has reached end', () async {
    // Mock an empty response from GetAllPeople
    when(() => getAllPeopleMock(page: any(named: 'page')))
        .thenAnswer((_) async => []);

    // Set hasReachedEnd to true to simulate the end of the list
    // controller.hasReachedEnd = true;

    expect(store.contentStatus, equals(PersonPageStatus.initial));

    // Call the method under test
    await store.fetchNextPage();

    // Verify the interactions and expected values
    expect(store.contentStatus, equals(PersonPageStatus.success));
    expect(store.currentPage, equals(2));
    expect(store.peopleList, isEmpty);
    expect(store.hasReachedEnd, isTrue);
  });
}
