import 'package:flutter/foundation.dart';
import 'package:rickmorty/layers/data/dto/person_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedCharacterListKey = 'CACHED_CHARACTER_LIST_PAGE';

abstract class LocalStorage {
  Future<bool> saveCharactersPage({
    required int page,
    required List<PersonDto> list,
  });

  List<PersonDto> loadCharactersPage({required int page});
}

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _sharedPref;

  LocalStorageImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPref = sharedPreferences;

  @override
  List<PersonDto> loadCharactersPage({required int page}) {
    final key = getKeyToPage(page);
    final jsonList = _sharedPref.getStringList(key);

    return jsonList != null
        ? jsonList.map((e) => PersonDto.fromRawJson(e)).toList()
        : [];
  }

  @override
  Future<bool> saveCharactersPage({
    required int page,
    required List<PersonDto> list,
  }) {
    final jsonList = list.map((e) => e.toRawJson()).toList();
    final key = getKeyToPage(page);
    return _sharedPref.setStringList(key, jsonList);
  }

  @visibleForTesting
  static String getKeyToPage(int page) {
    return '${cachedCharacterListKey}_$page';
  }
}
