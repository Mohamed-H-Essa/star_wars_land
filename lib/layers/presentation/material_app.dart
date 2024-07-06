import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:starwars/layers/presentation/theme.dart';
import 'package:starwars/layers/presentation/app_using_bloc.dart';
import 'package:starwars/main.dart';

class MaterialAppK extends StatefulWidget {
  const MaterialAppK({super.key, required this.body});
  final Widget body;

  @override
  State<MaterialAppK> createState() => _MaterialAppKState();
}

class _MaterialAppKState extends State<MaterialAppK> {
  var themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    const theme = CustomTheme();

    return MaterialApp(
      themeMode: themeMode,
      theme: theme.toThemeData(),
      darkTheme: theme.toThemeDataDark(),
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          final tt = Theme.of(context).textTheme;
          final cs = Theme.of(context).colorScheme;
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: Transform.translate(
                offset: const Offset(10, 0),
                child: Text(
                  'Starwars',
                  style: tt.headlineLarge!.copyWith(
                    color: cs.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ).animate().fadeIn(delay: .8.seconds, duration: .7.seconds),
              actions: [
                IconButton(
                  onPressed: () {
                    final useLight = themeMode == ThemeMode.dark ? true : false;
                    handleBrightnessChange(useLight);
                  },
                  icon: const Icon(Icons.light_mode),
                ),
                // PopupMenuButton<StateManagementOptions>(
                //   onSelected: (value) => setState(() {
                //     _currentOption = value;
                //   }),
                //   itemBuilder: (context) => [
                // _menuEntry(StateManagementOptions.bloc, 'Bloc'),
                //   ],
                // ),
              ],
            ),

            body: widget.body,
            // body: AppUsingBloc(
            //   getAllPeople: _getAllPeople,
            //   getAllFilms: _getAllFilms,
            //   getAllPlanets: _getAllPlanets,
            //   getAllSpecies: _getAllSpecies,
            //   getAllStarships: _getAllStarships,
            //   getAllVehicles: _getAllVehicles,
            // ).animate().fadeIn(delay: 1.2.seconds, duration: .7.seconds),
          );
        },
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // _Helpers
  // ---------------------------------------------------------------------------

  // PopupMenuItem<StateManagementOptions> _menuEntry(
  //   StateManagementOptions option,
  //   String text,
  // ) {
  //   final isSelected = _currentOption == option;
  //   final textTheme = Theme.of(context)
  //       .textTheme
  //       .apply(displayColor: Theme.of(context).colorScheme.onSurface);

  //   return PopupMenuItem<StateManagementOptions>(
  //     value: option,
  //     child: Text(
  //       isSelected ? 'using $text' : 'use $text',
  //       style: textTheme.bodyMedium!.copyWith(
  //         fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
  //         color: isSelected ? Colors.red : Colors.black,
  //       ),
  //     ),
  //   );
  // }

  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.system:
        return View.of(context).platformDispatcher.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }
}
