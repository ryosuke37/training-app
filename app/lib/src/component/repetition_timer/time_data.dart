import 'package:localizer/localizer.dart';

extension DurationEx on Duration {
  String get toDisplayString => '$inHours ${t.hours} '
      '${(inMinutes - inHours * 60).toString().padLeft(2, '0')} '
      '${t.minutes} '
      '${(inSeconds - (inMinutes * 60)).toString().padLeft(2, '0')} '
      '${t.seconds} ';
}
