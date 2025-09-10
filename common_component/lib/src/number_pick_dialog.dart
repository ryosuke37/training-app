import 'package:common_component/src/number_picker.dart';
import 'package:flutter/material.dart';

class NumberPickDialog extends StatefulWidget {
  const NumberPickDialog({
    required this.initialNumber,
    this.unit,
    this.minNumber = 0,
    this.maxNumber = 99,
    this.onOkTapped,
    this.onCancelTapped,
    super.key,
  });

  final int initialNumber;
  final Widget? unit;
  final int minNumber;
  final int maxNumber;
  final void Function(int)? onOkTapped;
  final void Function(int)? onCancelTapped;

  @override
  State<NumberPickDialog> createState() => _NumberPickDialogState();
}

class _NumberPickDialogState extends State<NumberPickDialog> {
  late int currentNumber;

  @override
  void initState() {
    super.initState();
    currentNumber = widget.initialNumber;
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
            NumberPicker(
              initialNumber: widget.initialNumber,
              unit: widget.unit,
              maxNumber: widget.maxNumber,
              minNumber: widget.minNumber,
              onChanged: (newNumber) {
                setState(() {
                  currentNumber = newNumber;
                });
              },
            ),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => widget.onCancelTapped?.call(currentNumber),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => widget.onOkTapped?.call(currentNumber),
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
