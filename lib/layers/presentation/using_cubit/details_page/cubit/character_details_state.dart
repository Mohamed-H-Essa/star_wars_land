part of 'character_details_cubit.dart';

class CharacterDetailsState with EquatableMixin {
  const CharacterDetailsState(this.character);

  final Person character;

  @override
  List<Object?> get props => [character];
}
