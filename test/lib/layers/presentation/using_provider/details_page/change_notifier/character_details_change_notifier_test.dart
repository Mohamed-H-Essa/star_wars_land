import 'package:flutter_test/flutter_test.dart';
import 'package:starwars/layers/presentation/using_provider/details_page/change_notifier/person_details_change_notifier.dart';

import '../../../../../../fixtures/fixtures.dart';

void main() {
  group('PersonDetailsChangeNotifier', () {
    test('initial state is correct', () {
      final c = personList1.first;

      final notifier = PersonDetailsChangeNotifier(person: c);

      expect(notifier.person, c);
    });
  });
}
