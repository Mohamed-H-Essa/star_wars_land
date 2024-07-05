import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starwars/layers/presentation/using_get_it/details_page/controller/person_details_controller.dart';
import 'package:starwars/layers/presentation/using_get_it/details_page/view/person_details_page.dart';
import 'package:starwars/layers/presentation/using_get_it/injector.dart';

import '../../../../../../fixtures/fixtures.dart';

void main() {
  final person = personList1.first;

  setUp(() async {
    await getIt.reset();
    getIt.registerLazySingleton(
      () => PersonDetailsController()..person = person,
    );
  });

  testWidgets(
    'PersonDetailsPage should renders correctly',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PersonDetailsPage(),
        ),
      );

      // Find items on the page
      expect(find.text('Details'), findsOneWidget);
      expect(find.text(person.name!), findsOneWidget);
      expect(find.text('Origin: ${person.origin!.name}'), findsOneWidget);
      expect(find.text('Species: ${person.species}'), findsOneWidget);
      expect(find.text('Type: ${person.type}'), findsOneWidget);
      expect(find.text('Gender: ${person.gender}'), findsOneWidget);
      expect(
        find.text('Status: ${person.isAlive ? 'ALIVE!' : 'DEAD!'}'),
        findsOneWidget,
      );
      expect(
        find.text('Last location: ${person.location!.name}'),
        findsOneWidget,
      );
      expectLater(
        find.byType(EpisodeItem),
        findsNWidgets(person.episode!.length),
      );
    },
  );
}
