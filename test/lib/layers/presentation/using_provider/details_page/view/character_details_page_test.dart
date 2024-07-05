import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:starwars/layers/presentation/using_provider/details_page/change_notifier/person_details_change_notifier.dart';
import 'package:starwars/layers/presentation/using_provider/details_page/view/person_details_page.dart';

import '../../../../../../fixtures/fixtures.dart';

void main() {
  testWidgets('PersonDetailsPage should render correctly',
      (WidgetTester tester) async {
    final person = personList1.first;

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => PersonDetailsChangeNotifier(person: person),
          child: const PersonDetailsPage(),
        ),
      ),
    );

    // Find items on the page
    expect(find.text('Details'), findsOneWidget);
    expect(find.text(person.name!), findsOneWidget);
    expect(find.text('Origin: ${person.origin!.name}'), findsOneWidget);
    expect(find.text('Species: ${person.species}'), findsOneWidget);
    expect(find.text('Type: ${person.type}'), findsOneWidget);
    expect(find.text('Gender: ${person.gender}'), findsOneWidget);
    expect(find.text('Status: ${person.isAlive ? 'ALIVE!' : 'DEAD!'}'),
        findsOneWidget);
    expect(
        find.text('Last location: ${person.location!.name}'), findsOneWidget);
    expectLater(
        find.byType(EpisodeItem), findsNWidgets(person.episode!.length));
  });
}
