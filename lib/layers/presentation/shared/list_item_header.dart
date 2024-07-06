import 'package:flutter/material.dart';
import 'package:starwars/layers/presentation/people/details_page/view/person_details_page.dart';
import 'package:starwars/layers/presentation/people/list_page/view/person_page.dart';
import 'package:starwars/layers/presentation/vehicles/list_page/view/vehicle_page.dart';

class ListItemHeader extends StatelessWidget {
  const ListItemHeader({
    super.key,
    required this.titleText,
  });

  final String titleText;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    void _goToPage(String option) {
      switch (option) {
        case 'All People':
          Navigator.of(context).push<void>(PersonPage.route());
          break;
        case 'All Vehicles':
          Navigator.of(context).push<void>(VehiclePage.route(context));
          break;
        default:
          Navigator.of(context).push<void>(PersonPage.route());
      }
    }

    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push<void>(VehiclePage.route(context));
          },
          child: Text(
            'hi',
          ),
        ),
        PopupMenuButton(
          onSelected: (value) {
            _goToPage(value);
          },
          itemBuilder: (ctx) {
            return [
              _menuEntry('All Peopl'),
              _menuEntry('All Vehicles'),
            ];
          },
          child: Card(
            elevation: 0,
            color: cs.tertiaryContainer,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(
                      Icons.person,
                      color: cs.onTertiaryContainer,
                      size: 18,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      titleText,
                      style: tt.titleMedium!.copyWith(
                        color: cs.onTertiaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            height: 1,
            color: cs.tertiaryContainer,
          ),
        ),
      ],
    );
  }

  PopupMenuItem<dynamic> _menuEntry(
    String text,
  ) {
    return PopupMenuItem(
      value: text,
      child: Text(text),
    );
  }
}
