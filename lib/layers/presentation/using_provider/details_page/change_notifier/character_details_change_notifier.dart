import 'package:flutter/foundation.dart';
import 'package:rickmorty/layers/domain/entity/people.dart';

class CharacterDetailsChangeNotifier extends ChangeNotifier {
  CharacterDetailsChangeNotifier({required this.character});

  final Person character;
}
