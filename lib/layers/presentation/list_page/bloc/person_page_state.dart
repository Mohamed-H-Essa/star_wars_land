part of 'person_page_bloc.dart';

enum PersonPageStatus { initial, loading, success, failure }

class PersonPageState extends Equatable {
  const PersonPageState({
    this.status = PersonPageStatus.initial,
    this.people = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
  });

  final PersonPageStatus status;
  final List<Person> people;
  final bool hasReachedEnd;
  final int currentPage;

  PersonPageState copyWith({
    PersonPageStatus? status,
    List<Person>? people,
    bool? hasReachedEnd,
    int? currentPage,
  }) {
    return PersonPageState(
      status: status ?? this.status,
      people: people ?? this.people,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [
        status,
        people,
        hasReachedEnd,
        currentPage,
      ];
}
