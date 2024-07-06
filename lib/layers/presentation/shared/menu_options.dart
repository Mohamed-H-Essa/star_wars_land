import 'package:flutter/material.dart';

enum NavOptions {
  people,
  vehicle,
}

// PopupMenuItem<NavOptions> _menuEntry(
//   NavOptions option,
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
