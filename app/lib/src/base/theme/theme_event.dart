part of './theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {}

class ThemeUpdated extends ThemeEvent {
  ThemeUpdated({required this.theme});

  final AppTheme theme;

  @override
  List<Object?> get props => [theme];
}
