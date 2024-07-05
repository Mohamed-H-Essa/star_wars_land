import 'package:starwars/layers/domain/entity/planet.dart';
import 'package:starwars/layers/domain/repository/starwars_repository.dart';

class GetAllPlanets {
  GetAllPlanets({
    required StarwarsRepository repository,
  }) : _repository = repository;

  final StarwarsRepository _repository;

  Future<List<Planet>> call({int page = 0}) async {
    final list = await _repository.getPlanets(page: page);
    return list;
  }
}
