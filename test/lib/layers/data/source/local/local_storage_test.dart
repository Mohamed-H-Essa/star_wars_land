import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/data/source/local/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/fixtures.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late LocalStorageImpl localStorage;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() async {
    mockSharedPreferences = MockSharedPreferences();
    localStorage = LocalStorageImpl(sharedPreferences: mockSharedPreferences);
  });

  group('LocalStorageImpl', () {
    test('should save a list of PersonDto per page', () async {
      when(() => mockSharedPreferences.setStringList(any(), any()))
          .thenAnswer((_) async => true);

      // List 1
      final result1 = await localStorage.savePeoplePage(
        page: 1,
        list: personList1,
      );
      expect(result1, true);
      final key1 = LocalStorageImpl.getKeyToPage(1, 'people');
      final list1Raw = personList1.map((e) => e.toRawJson()).toList();
      verify(() => mockSharedPreferences.setStringList(key1, list1Raw))
          .called(1);

      // List 2
      final result2 = await localStorage.savePeoplePage(
        page: 2,
        list: personList2,
      );
      expect(result2, true);
      final key2 = LocalStorageImpl.getKeyToPage(2, 'people');
      final list2Raw = personList2.map((e) => e.toRawJson()).toList();
      verify(() => mockSharedPreferences.setStringList(key2, list2Raw))
          .called(1);

      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('should load a list of PersonDto per page', () {
      // List 1
      final key1 = LocalStorageImpl.getKeyToPage(1, 'people');
      when(() => mockSharedPreferences.getStringList(key1)).thenReturn(
        personList1.map((e) => e.toRawJson()).toList(),
      );

      final result1 = localStorage.loadPeoplePage(page: 1);

      expect(result1, hasLength(2));
      for (int i = 0; i < personList1.length; i++) {
        expect(result1[i], personList1[i]);
      }
      verify(() => mockSharedPreferences.getStringList(key1)).called(1);

      // List 2
      final key2 = LocalStorageImpl.getKeyToPage(2, 'people');
      when(() => mockSharedPreferences.getStringList(key2)).thenReturn(
        personList2.map((e) => e.toRawJson()).toList(),
      );

      final result2 = localStorage.loadPeoplePage(page: 2);

      expect(result2, hasLength(2));
      for (int i = 0; i < personList2.length; i++) {
        expect(result2[i], personList2[i]);
      }
      verify(() => mockSharedPreferences.getStringList(key2)).called(1);

      verifyNoMoreInteractions(mockSharedPreferences);
    });
  });
}
