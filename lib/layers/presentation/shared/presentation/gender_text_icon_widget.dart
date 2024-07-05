import 'package:flutter/material.dart';
import 'package:starwars/layers/domain/entity/person.dart';

class GenderTextIconWidget extends StatelessWidget {
  const GenderTextIconWidget({
    super.key,
    required this.textStyle,
    required this.person,
  });

  final TextStyle textStyle;
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Gender: ',
          style: textStyle.copyWith(
            color: person.gender == 'male'
                ? Colors.blueAccent[100]
                : person.gender == 'female'
                    ? Colors.pink[200]
                    : Colors.grey[400],
          ),
        ),
        Icon(
          person.gender == 'male'
              ? Icons.male
              : person.gender == 'female'
                  ? Icons.female
                  : Icons.cancel,
          color: person.gender == 'male'
              ? Colors.blueAccent[100]
              : person.gender == 'female'
                  ? Colors.pink[200]
                  : Colors.grey[400],
          size: textStyle.fontSize! + 7,
        ),
      ],
    );
  }
}
