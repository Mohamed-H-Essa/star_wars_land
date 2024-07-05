import 'package:starwars/layers/domain/entity/vehicle.dart';
import 'package:starwars/layers/domain/repository/starwars_repository.dart';

class GetAllVehicles {
  GetAllVehicles({
    required StarwarsRepository repository,
  }) : _repository = repository;

  final StarwarsRepository _repository;

  Future<List<Vehicle>> call({int page = 0}) async {
    final list = await _repository.getVehicles(page: page);
    return list;
  }
}
