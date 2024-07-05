part of 'person_details_bloc.dart';

class PersonDetailsState with EquatableMixin {
  PersonDetailsState({required this.person});

  final Person person;

  @override
  List<Object?> get props => [person];
}
