import 'package:common_component/src/time_picker.dart';
import 'package:flutter/material.dart';

class TimePickDialog extends StatefulWidget {
  const TimePickDialog({
    required this.initialDuration,
    this.onOkTapped,
    this.onCancelTapped,
    super.key,
  });

  final Duration initialDuration;
  final void Function(Duration)? onOkTapped;
  final void Function(Duration)? onCancelTapped;

  @override
  State<TimePickDialog> createState() => _TimePickDialogState();
}

class _TimePickDialogState extends State<TimePickDialog> {
  late Duration currentDuration;

  @override
  void initState() {
    super.initState();
    currentDuration = widget.initialDuration;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 300,
      height: 200,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            TimerPicker(
              initialDuration: widget.initialDuration,
              onChanged: (newDuration) {
                setState(() {
                  currentDuration = newDuration;
                });
              },
            ),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => widget.onCancelTapped?.call(currentDuration),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => widget.onOkTapped?.call(currentDuration),
                    child: const Text('OK'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
