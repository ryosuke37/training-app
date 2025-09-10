import 'package:flutter/material.dart';

class TimerPicker extends StatefulWidget {
  TimerPicker({
    required Duration initialDuration,
    required void Function(Duration) onChanged,
    super.key,
  })  : _onChanged = onChanged,
        initialHours = initialDuration.inHours,
        initialMinutes =
            initialDuration.inMinutes - (initialDuration.inHours * 60),
        initialSeconds =
            initialDuration.inSeconds - (initialDuration.inMinutes * 60);

  final int initialHours;
  final int initialMinutes;
  final int initialSeconds;
  final void Function(Duration) _onChanged;

  @override
  State<StatefulWidget> createState() => TimerPickerState();
}

class TimerPickerState extends State<TimerPicker> {
  late FixedExtentScrollController _hourScrollController;
  late FixedExtentScrollController _minutesScrollController;
  late FixedExtentScrollController _secondsScrollController;
  int currentIndex = 0;
  final hoursList = List.generate(24, (index) => index);
  final minutesList = List.generate(60, (index) => index);
  final secondsList = List.generate(60, (index) => index);

  Duration _getCurrentTime() {
    final hours = _hourScrollController.selectedItem % hoursList.length;
    final minutes = _minutesScrollController.selectedItem % minutesList.length;
    final seconds = _secondsScrollController.selectedItem % secondsList.length;
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  @override
  void initState() {
    super.initState();
    _hourScrollController = FixedExtentScrollController(
      initialItem: widget.initialHours,
    );
    _hourScrollController.addListener(() {
      widget._onChanged(_getCurrentTime());
    });
    _minutesScrollController = FixedExtentScrollController(
      initialItem: widget.initialMinutes,
    );
    _minutesScrollController.addListener(() {
      widget._onChanged(_getCurrentTime());
    });
    _secondsScrollController =
        FixedExtentScrollController(initialItem: widget.initialSeconds);
    _secondsScrollController.addListener(() {
      widget._onChanged(_getCurrentTime());
    });
  }

  @override
  void dispose() {
    _hourScrollController.removeListener(() {});
    _minutesScrollController.removeListener(() {});
    _secondsScrollController.removeListener(() {});
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: drumUI(_hourScrollController, hoursList)),
            const Text('hour'),
            Expanded(child: drumUI(_minutesScrollController, minutesList)),
            const Text('min'),
            Expanded(child: drumUI(_secondsScrollController, secondsList)),
            const Text('sec'),
          ],
        ),
      ),
    );
  }
}
