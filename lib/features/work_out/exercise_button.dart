import 'package:flutter/material.dart';
import 'package:flutter_learning_path/styling/text_styling_extension.dart';

class ExerciseButton extends StatelessWidget {
  const ExerciseButton({
    Key? key,
    required this.currentReps,
    required this.targetReps,
    required this.handlePress,
  }) : super(key: key);

  final int? currentReps;
  final int targetReps;
  final void Function() handlePress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: currentReps == null
          ? TextButton.styleFrom(
              backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xFF262626)),
              shape: CircleBorder(eccentricity: 0.1),
            )
          : TextButton.styleFrom(
              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.redAccent),
              shape: CircleBorder(eccentricity: 0.1),
            ),
      onPressed: handlePress,
      child: Text(
        '${currentReps ?? targetReps}',
        style: currentReps == null
            ? Theme.of(context).textTheme.bodyLarge?.withColorGrey.withWeightLight
            : Theme.of(context).textTheme.bodyLarge?.withColorWhite.withWeightLight,
      ),
    );
  }
}
