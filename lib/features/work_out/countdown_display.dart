import 'package:flutter/material.dart';
import 'package:flutter_learning_path/features/work_out/timer_notifier.dart';
import 'package:flutter_learning_path/styling/text_styling_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CountdownDisplay extends ConsumerWidget {
  const CountdownDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secondsLeft = ref.watch($timer.select((value) => value.secondsLeft));

    return secondsLeft > 0
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Wait for ${secondsLeft ~/ 60} : ${NumberFormat('00').format(secondsLeft % 60)}',
                      style: Theme.of(context).textTheme.bodyLarge?.withWeightMedium,
                    ),
                    IconButton(
                      onPressed: () => ref.watch($timer.notifier).stopCountdown(),
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
