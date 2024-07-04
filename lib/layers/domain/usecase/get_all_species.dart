import 'package:rickmorty/layers/domain/entity/species.dart';
import 'package:rickmorty/layers/domain/repository/starwars_repository.dart';

class GetAllSpecies {
  GetAllSpecies({
    required StarwarsRepository repository,
  }) : _repository = repository;

  final StarwarsRepository _repository;

  Future<List<Species>> call({int page = 0}) async {
    final list = await _repository.getSpecies(page: page);
    return list;
  }
}
