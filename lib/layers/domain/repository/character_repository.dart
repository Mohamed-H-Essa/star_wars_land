import 'package:rickmorty/layers/domain/entity/people.dart';

abstract class CharacterRepository {
  Future<List<Person>> getCharacters({int page = 0});
}
