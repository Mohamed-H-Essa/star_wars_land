import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final void Function(String) onChanged;

  const SearchField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: colorScheme.onSurfaceVariant),
          hintText: 'Search...',
          hintStyle: theme.textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          filled: true,
          fillColor: colorScheme.surfaceVariant,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        ),
        style: theme.textTheme.bodyMedium!.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}
