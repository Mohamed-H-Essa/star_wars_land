import 'package:starwars/layers/domain/entity/starship.dart';
import 'package:starwars/layers/domain/repository/starwars_repository.dart';

class GetAllStarships {
  GetAllStarships({
    required StarwarsRepository repository,
  }) : _repository = repository;

  final StarwarsRepository _repository;

  Future<List<Starship>> call({int page = 0}) async {
    final list = await _repository.getStarships(page: page);
    return list;
  }
}
