import 'package:flutter/foundation.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';

enum CharacterPageStatus { initial, loading, success, failed }

class CharacterPageController {
  CharacterPageController({
    required GetAllPeople getAllCharacters,
  }) : _getAllCharacters = getAllCharacters;

  final GetAllPeople _getAllCharacters;

  final status = ValueNotifier(CharacterPageStatus.initial);
  final characters = ValueNotifier(<Person>[]);
  final currentPage = ValueNotifier(1);
  final hasReachedEnd = ValueNotifier(false);

  Future<void> fetchNextPage() async {
    if (hasReachedEnd.value) return;

    status.value = CharacterPageStatus.loading;

    final list = await _getAllCharacters(page: currentPage.value);

    currentPage.value = currentPage.value + 1;
    characters.value = characters.value..addAll(list);
    status.value = CharacterPageStatus.success;
    hasReachedEnd.value = list.isEmpty;
  }
}
