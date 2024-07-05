import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwars/layers/presentation/using_riverpod/providers.dart';
import 'package:starwars/layers/presentation/using_riverpod/list_page/view/person_page.dart';

import '../../../../../../fixtures/fixtures.dart';
import '../../../helper/pump_app.dart';

void main() {
  group('PersonPage', () {
    late GetAllPeopleMock getAllPeopleMock;

    setUp(() {
      getAllPeopleMock = GetAllPeopleMock();
      when(() => getAllPeopleMock.call(page: any(named: 'page')))
          .thenAnswer((_) async => [...personList1, ...personList2]);
    });

    testWidgets('renders a PersonView', (tester) async {
      when(() => getAllPeopleMock(page: any(named: 'page'))).thenAnswer(
        (_) async => personList1,
      );

      await tester.pumpApp(
        ProviderScope(
          overrides: [
            getAllPeopleProvider.overrideWith((ref) => getAllPeopleMock),
          ],
          child: const PersonPage(),
        ),
      );

      expect(find.byType(PersonView), findsOneWidget);
    });
  });
}
