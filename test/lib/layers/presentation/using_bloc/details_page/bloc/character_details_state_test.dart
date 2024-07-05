import 'package:flutter_test/flutter_test.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/presentation/using_bloc/details_page/bloc/person_details_bloc.dart';

void main() {
  group('PersonDetailsPAgeState', () {
    test('it should be able to create a new instance', () {
      final person = Person(id: 11);
      final state = PersonDetailsState(person: person);
      expect(state.person, person);
    });

    test('equivalent instances have the same props', () {
      final state1 = PersonDetailsState(
        person: Person(id: 1, name: 'John J'),
      );

      final state2 = PersonDetailsState(
        person: Person(id: 1, name: 'John J'),
      );

      expect(state1, state2);
    });

    test('distinct instances have different props', () {
      final state1 = PersonDetailsState(
        person: Person(id: 1, name: 'John J'),
      );

      final state2 = PersonDetailsState(
        person: Person(id: 1, name: 'John M'),
      );

      expect(state1, isNot(equals(state2)));
    });
  });
}
