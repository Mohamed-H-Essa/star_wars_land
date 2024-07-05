import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/presentation/using_bloc/list_page/bloc/person_page_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('PersonPageState', () {
    test('copyWith creates a new instance with the provided values', () {
      final state = PersonPageState(
        status: PersonPageStatus.loading,
        people: [Person(id: 1, name: 'John')],
        hasReachedEnd: true,
        currentPage: 2,
      );

      final newState = state.copyWith(
        status: PersonPageStatus.success,
        people: [Person(id: 2, name: 'Jane')],
        hasReachedEnd: false,
        currentPage: 3,
      );

      expect(newState.status, equals(PersonPageStatus.success));
      expect(newState.people.length, equals(1));
      expect(newState.people[0].id, equals(2));
      expect(newState.people[0].name, equals('Jane'));
      expect(newState.hasReachedEnd, equals(false));
      expect(newState.currentPage, equals(3));
    });

    test('copyWith maintains unchanged values', () {
      final state = PersonPageState(
        status: PersonPageStatus.loading,
        people: [Person(id: 1, name: 'John')],
        hasReachedEnd: true,
        currentPage: 2,
      );

      final newState = state.copyWith(status: PersonPageStatus.success);

      expect(newState.status, equals(PersonPageStatus.success));
      expect(newState.people, equals(state.people));
      expect(newState.hasReachedEnd, equals(state.hasReachedEnd));
      expect(newState.currentPage, equals(state.currentPage));
    });

    test('props returns a list of the object properties', () {
      final state = PersonPageState(
        status: PersonPageStatus.loading,
        people: [Person(id: 1, name: 'John')],
        hasReachedEnd: true,
        currentPage: 2,
      );

      final props = state.props;

      expect(props.length, equals(4));
      expect(props[0], equals(PersonPageStatus.loading));
      expect(props[1], equals(state.people));
      expect(props[2], equals(true));
      expect(props[3], equals(2));
    });

    test('equivalent instances have the same props', () {
      final state1 = PersonPageState(
        status: PersonPageStatus.loading,
        people: [Person(id: 1, name: 'John')],
        hasReachedEnd: true,
        currentPage: 2,
      );

      final state2 = PersonPageState(
        status: PersonPageStatus.loading,
        people: [Person(id: 1, name: 'John')],
        hasReachedEnd: true,
        currentPage: 2,
      );

      expect(state1.props, equals(state2.props));
    });

    test('distinct instances have different props', () {
      final state1 = PersonPageState(
        status: PersonPageStatus.loading,
        people: [Person(id: 1, name: 'John')],
        hasReachedEnd: true,
        currentPage: 2,
      );

      final state2 = PersonPageState(
        status: PersonPageStatus.success,
        people: [Person(id: 2, name: 'Jane')],
        hasReachedEnd: false,
        currentPage: 3,
      );

      expect(state1.props, isNot(equals(state2.props)));
    });
  });
}
