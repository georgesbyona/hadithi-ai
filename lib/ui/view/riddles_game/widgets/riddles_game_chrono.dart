import 'dart:async';

import 'package:flutter/material.dart';

import '/ui/ui.dart';

class RiddlesGameChrono extends StatefulWidget {
  final RiddleProvider riddleProvider;
  const RiddlesGameChrono({super.key, required this.riddleProvider});

  @override
  State<RiddlesGameChrono> createState() => _RiddlesGameChronoState();
}

class _RiddlesGameChronoState extends State<RiddlesGameChrono> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    widget.riddleProvider.resetChrono();
    _timer?.cancel();
    startChrono();
  }

  void startChrono() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (widget.riddleProvider.secondsLeft > 0) {
        widget.riddleProvider.decreaseSecsLeft();
      } else {
        widget.riddleProvider.timeIsOver();
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.riddleProvider.resetChrono();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.primary, width: 1.5),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "= Chrono: ",
            style: textTheme.bodyLarge!.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${widget.riddleProvider.formattedTime} =",
            style: textTheme.bodyLarge!.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
