import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  const NumberPicker({
    required this.initialNumber,
    required void Function(int) onChanged,
    this.unit,
    this.minNumber = 0,
    this.maxNumber = 99,
    super.key,
  }) : _onChanged = onChanged;

  final int initialNumber;
  final Widget? unit;
  final int minNumber;
  final int maxNumber;
  final void Function(int) _onChanged;

  @override
  State<StatefulWidget> createState() => NumberPickerState();
}

class NumberPickerState extends State<NumberPicker> {
  late FixedExtentScrollController _numberScrollController;
  int currentIndex = 0;
  late List<int> numbersList;

  int _getCurrentNumber() =>
      _numberScrollController.selectedItem % numbersList.length;

  @override
  void initState() {
    super.initState();
    numbersList =
        List.generate(widget.maxNumber - widget.minNumber, (index) => index);
    _numberScrollController = FixedExtentScrollController(
      initialItem: widget.initialNumber,
    );
    _numberScrollController.addListener(() {
      widget._onChanged(_getCurrentNumber());
    });
  }

  @override
  void dispose() {
    _numberScrollController.removeListener(() {});
    super.dispose();
  }

  ListWheelScrollView drumUI(
    ScrollController scrollController,
    List<int> list,
  ) {
    return ListWheelScrollView.useDelegate(
      controller: scrollController,
      itemExtent: 50,
      physics: const FixedExtentScrollPhysics(),
      diameterRatio: 1,
      squeeze: 1.5,
      childDelegate: ListWheelChildLoopingListDelegate(
        children: list
            .map<Widget>(
              (int index) => SizedBox(
                width: double.infinity,
                height: 20,
                child: Center(
                  child: Text(index.toString()),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final unit = widget.unit ?? const SizedBox.shrink();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: drumUI(_numberScrollController, numbersList)),
            const SizedBox(width: 10),
            unit,
          ],
        ),
      ),
    );
  }
}
