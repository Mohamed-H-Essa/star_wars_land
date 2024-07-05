import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/domain/repository/starwars_repository.dart';

class GetAllPeople {
  GetAllPeople({
    required StarwarsRepository repository,
  }) : _repository = repository;

  final StarwarsRepository _repository;

  Future<List<Person>> call({int page = 0}) async {
    final list = await _repository.getPeople(page: page);
    return list;
  }
}
