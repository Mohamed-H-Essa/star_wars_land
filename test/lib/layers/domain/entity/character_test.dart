import 'package:starwars/layers/domain/entity/person.dart';
import 'package:test/test.dart';

void main() {
  group('Character', () {
    test('Two instances with the same properties should be equal', () {
      final character1 = Person(
        id: 1,
        name: 'Rick Sanchez',
        status: 'Alive',
        species: 'Human',
      );

      final character2 = Person(
        id: 1,
        name: 'Rick Sanchez',
        status: 'Alive',
        species: 'Human',
      );

      expect(character1, equals(character2));
    });

    test('Two instances with different properties should be different', () {
      final character1 = Person(
        id: 1,
        name: 'Rick Sanchez',
        status: 'Alive',
        species: 'Human',
      );

      final character2 = Person(
        id: 2,
        name: 'Morty Smith',
        status: 'Alive',
        species: 'Human',
      );

      expect(character1, isNot(equals(character2)));
    });
  });
}
