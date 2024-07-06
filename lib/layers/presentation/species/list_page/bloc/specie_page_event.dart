part of 'specie_page_bloc.dart';

sealed class SpeciePageEvent extends Equatable {
  const SpeciePageEvent();

  @override
  List<Object?> get props => [];
}

final class FetchNextPageEvent extends SpeciePageEvent {
  const FetchNextPageEvent();
}

final class SearchInputPageEvent extends SpeciePageEvent {
  const SearchInputPageEvent(this.query);
  final String query;
}