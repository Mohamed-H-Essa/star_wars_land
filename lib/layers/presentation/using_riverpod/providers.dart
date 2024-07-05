import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starwars/layers/data/starwars_repository_impl.dart';
import 'package:starwars/layers/data/source/local/local_storage.dart';
import 'package:starwars/layers/data/source/network/api.dart';
import 'package:starwars/layers/domain/repository/character_repository.dart';
import 'package:starwars/layers/domain/usecase/get_all_people.dart';
import 'package:starwars/main.dart';

// -----------------------------------------------------------------------------
// Presentation
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Domain
// -----------------------------------------------------------------------------
final characterRepositoryProvider = Provider<CharacterRepository>(
  (ref) => StarwarsRepositoryImpl(
    api: ref.read(apiProvider),
    localStorage: ref.read(localStorageProvider),
  ),
);

final getAllCharactersProvider = Provider(
  (ref) => GetAllPeople(
    repository: ref.read(characterRepositoryProvider),
  ),
);

// -----------------------------------------------------------------------------
// Data
// -----------------------------------------------------------------------------
final apiProvider = Provider<Api>((ref) => ApiImpl());

final localStorageProvider = Provider<LocalStorage>(
  (ref) => LocalStorageImpl(sharedPreferences: sharedPref),
);
