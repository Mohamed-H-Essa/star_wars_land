part of 'person_page_bloc.dart';

sealed class PersonPageEvent extends Equatable {
  const PersonPageEvent();

  @override
  List<Object?> get props => [];
}

final class FetchNextPageEvent extends PersonPageEvent {
  const FetchNextPageEvent();
}

final class SearchInputPageEvent extends PersonPageEvent {
  const SearchInputPageEvent(this.query);
  final String query;
}
