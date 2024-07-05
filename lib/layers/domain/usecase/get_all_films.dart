import 'package:starwars/layers/domain/entity/film.dart';
import 'package:starwars/layers/domain/repository/starwars_repository.dart';

class GetAllFilms {
  GetAllFilms({
    required StarwarsRepository repository,
  }) : _repository = repository;

  final StarwarsRepository _repository;

  Future<List<Film>> call({int page = 0}) async {
    final list = await _repository.getFilms(page: page);
    return list;
  }
}
