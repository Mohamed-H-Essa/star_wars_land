import 'package:starwars/layers/domain/entity/specie.dart';
import 'package:starwars/layers/domain/repository/starwars_repository.dart';

class GetAllSpecies {
  GetAllSpecies({
    required StarwarsRepository repository,
  }) : _repository = repository;

  final StarwarsRepository _repository;

  Future<List<Specie>> call({int page = 0}) async {
    final list = await _repository.getSpecies(page: page);
    return list;
  }
}
