import 'package:mobx/mobx.dart';
import 'package:starwars/layers/domain/entity/person.dart';

part 'character_details_page_store.g.dart';

class CharacterDetailsPageStore = CharacterDetailsPageStoreBase
    with _$CharacterDetailsPageStore;

abstract class CharacterDetailsPageStoreBase with Store {
  CharacterDetailsPageStoreBase({
    required Person character,
  }) : _character = character;

  @readonly
  // ignore: prefer_final_fields
  late Person _character;
}
