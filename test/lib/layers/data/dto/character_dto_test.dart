import 'package:starwars/layers/data/dto/person_dto.dart';
import 'package:test/test.dart';

void main() {
  group('PersonDto', () {
    late String referenceRawJson;
    late PersonDto referenceDto;

    setUp(() {
      referenceDto = PersonDto(
        id: 1,
        name: 'Rick Sanchez',
      );

      referenceRawJson = referenceDto.toRawJson();
    });

    test('should create PersonDto instance to/from JSON', () {
      final createdDto = PersonDto.fromRawJson(referenceRawJson);
      final json = createdDto.toRawJson();
      expect(createdDto, referenceDto);
      expect(json, referenceRawJson);
    });
  });
}
