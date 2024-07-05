import 'package:rickmorty/layers/data/source/local/local_storage.dart';
import 'package:rickmorty/layers/data/source/network/api.dart';
import 'package:rickmorty/layers/domain/entity/person.dart';
import 'package:rickmorty/layers/domain/repository/starwars_repository.dart';
import 'package:rickmorty/layers/domain/usecase/get_all_people.dart';

class StarwarsRepositoryImpl implements StarwarsRepository {
  final Api _api;
  final LocalStorage _localStorage;

  StarwarsRepositoryImpl({
    required Api api,
    required LocalStorage localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  @override
  Future<List<Person>> getPeople({int page = 0}) async {
    final cachedList = _localStorage.loadCharactersPage(page: page);
    if (cachedList.isNotEmpty) {
      return cachedList;
    }

    final fetchedList = await _api.loadCharacters(page: page);
    await _localStorage.saveCharactersPage(page: page, list: fetchedList);
    return fetchedList;
  }
}
