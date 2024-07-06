import 'package:flutter/material.dart';
import 'package:starwars/layers/presentation/films/list_page/view/film_page.dart';
import 'package:starwars/layers/presentation/people/list_page/view/person_page.dart';
import 'package:starwars/layers/presentation/planets/list_page/view/planet_page.dart';
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
          Navigator.of(context).pushReplacement(PersonPage.route());
          break;
        case 'All Vehicles':
          Navigator.of(context).pushReplacement(VehiclePage.route());
          break;
        case 'All Planets':
          Navigator.of(context).pushReplacement(PlanetPage.route());
          break;
        case 'All Films':
          Navigator.of(context).pushReplacement(FilmPage.route());
          break;
        default:
          Navigator.of(context).pushReplacement(PersonPage.route());
      }
    }

    return Column(
      children: [
        PopupMenuButton(
          onSelected: (value) {
            _goToPage(value);
          },
          itemBuilder: (ctx) {
            return [
              _menuEntry('All People', titleText: titleText),
              _menuEntry('All Vehicles', titleText: titleText),
              _menuEntry('All Planets', titleText: titleText),
              _menuEntry('All Films', titleText: titleText),
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

  PopupMenuItem<dynamic> _menuEntry(String text, {required String titleText}) {
    return PopupMenuItem(
      value: text,
      child: Text(
        text,
        style: TextStyle(color: text == titleText ? Colors.red : null),
      ),
    );
  }
}
