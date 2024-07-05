import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/presentation/using_cubit/details_page/cubit/person_details_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('PersonDetailsState', () {
    test('supports value equality', () {
      final person1 = Person(id: 1, name: 'Test Person');
      final person2 = Person(id: 1, name: 'Test Person');

      final state1 = PersonDetailsState(person1);
      final state2 = PersonDetailsState(person2);

      // Expect the states to be equal because their people are equal
      expect(state1, equals(state2));
    });

    test('handles different people', () {
      final person1 = Person(id: 1, name: 'Test Person');
      final person2 = Person(id: 2, name: 'Another Person');

      final state1 = PersonDetailsState(person1);
      final state2 = PersonDetailsState(person2);

      // Expect the states to be different because their people are different
      expect(state1, isNot(equals(state2)));
    });
  });
}
