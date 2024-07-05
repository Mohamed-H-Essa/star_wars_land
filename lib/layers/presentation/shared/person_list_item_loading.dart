import 'package:flutter/material.dart';

class PersonListItemLoading extends StatelessWidget {
  const PersonListItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
