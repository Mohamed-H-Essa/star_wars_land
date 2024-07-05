import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/presentation/using_cubit/details_page/cubit/person_details_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('PersonDetailsCubit', () {
    test('it should have correct initial state', () {
      final person = Person(id: 1, name: 'Test Person');
      final cubit = PersonDetailsCubit(person: person);
      final expected = PersonDetailsState(person);
      expect(cubit.state, expected);
    });
  });
}
