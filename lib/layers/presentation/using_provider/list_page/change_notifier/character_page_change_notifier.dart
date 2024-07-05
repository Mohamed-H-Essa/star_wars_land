import 'package:flutter/material.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';

enum CharacterPageStatus { initial, loading, success, failed }

class CharacterPageChangeNotifier extends ChangeNotifier {
  CharacterPageChangeNotifier({
    required GetAllPeople getAllCharacters,
    List<Person>? characters,
    CharacterPageStatus? initialStatus,
    int? initialPage,
  })  : _getAllCharacters = getAllCharacters,
        _characters = characters ?? [],
        _status = initialStatus ?? CharacterPageStatus.initial,
        _currentPage = initialPage ?? 1;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------
  final GetAllPeople _getAllCharacters;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------
  CharacterPageStatus _status;
  CharacterPageStatus get status => _status;

  final List<Person> _characters;
  List<Person> get characters => List.unmodifiable(_characters);

  int _currentPage;
  int get currentPage => _currentPage;

  var _hasReachedEnd = false;
  bool get hasReachedEnd => _hasReachedEnd;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------
  Future<void> fetchNextPage() async {
    if (_hasReachedEnd) return;

    _status = CharacterPageStatus.loading;
    notifyListeners();

    final list = await _getAllCharacters(page: _currentPage);
    _currentPage++;
    _characters.addAll(list);
    _status = CharacterPageStatus.success;
    _hasReachedEnd = list.isEmpty;
    notifyListeners();
  }
}
