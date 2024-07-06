part of 'specie_details_bloc.dart';

class SpecieDetailsState with EquatableMixin {
  SpecieDetailsState({required this.specie});

  final Specie specie;

  @override
  List<Object?> get props => [specie];
}
