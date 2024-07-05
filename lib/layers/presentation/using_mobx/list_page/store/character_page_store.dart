import 'package:mobx/mobx.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';

part 'character_page_store.g.dart';

enum CharacterPageStatus { initial, loading, success, failed }

class CharacterPageStore = CharacterPageStoreBase with _$CharacterPageStore;

abstract class CharacterPageStoreBase with Store {
  CharacterPageStoreBase({
    required GetAllPeople getAllCharacters,
  }) : _getAllCharacters = getAllCharacters;

  final GetAllPeople _getAllCharacters;

  @readonly
  var _contentStatus = CharacterPageStatus.initial;

  @readonly
  var _currentPage = 1;

  @readonly
  var _hasReachedEnd = false;

  final charactersList = ObservableList<Person>();

  @action
  Future<void> fetchNextPage() async {
    if (_hasReachedEnd) return;

    _contentStatus = CharacterPageStatus.loading;

    final list = await _getAllCharacters(page: _currentPage);

    _currentPage++;
    charactersList.addAll(list);
    _contentStatus = CharacterPageStatus.success;
    _hasReachedEnd = list.isEmpty;
  }
}
