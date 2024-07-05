import 'package:flutter_test/flutter_test.dart';
import 'package:starwars/layers/presentation/using_get_it/details_page/controller/person_details_controller.dart';

import '../../../../../../fixtures/fixtures.dart';

void main() {
  late PersonDetailsController controller;

  test('It should be able to create a new instance', () {
    final c = personList1.first;
    controller = PersonDetailsController()..person = c;
    expect(controller.person, c);
  });
}
