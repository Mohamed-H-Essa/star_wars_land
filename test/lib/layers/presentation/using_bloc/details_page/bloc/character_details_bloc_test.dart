import 'package:flutter_test/flutter_test.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/presentation/using_bloc/details_page/bloc/person_details_bloc.dart';

import '../../../../../../fixtures/fixtures.dart';

void main() {
  group('PersonDetailsBloc', () {
    test('initial state is correct', () {
      Person c = personList1.first;

      final expected = PersonDetailsState(person: c);
      final initial = PersonDetailsBloc(person: c).state;

      expect(initial, expected);
    });
  });
}
