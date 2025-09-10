part of './timer_bloc.dart';

class Routine extends Equatable {
  const Routine({
    required this.name,
    required this.description,
    required this.actions,
    required this.repeatNum,
  });

  Routine.initial()
      : this(
          name: 'routine name',
          description: 'routine description',
          actions: [const Action.initial()],
          repeatNum: 2,
        );

  const Routine.training()
      : this(
          name: 'training',
          description: 'push-ups and sit-ups 2 sets.',
          actions: const [
            Action(
              name: 'push-ups',
              readyDuration: Duration(seconds: 3),
              workDuration: Duration(seconds: 5),
            ),
            Action(
              name: 'sit-ups',
              readyDuration: Duration(seconds: 4),
              workDuration: Duration(seconds: 6),
            ),
          ],
          repeatNum: 2,
        );
  const Routine.study()
      : this(
          name: 'study',
          description: 'Math and Science',
          actions: const [
            Action(
              name: 'Math',
              readyDuration: Duration(minutes: 2),
              workDuration: Duration(minutes: 20),
            ),
            Action(
              name: 'Science',
              readyDuration: Duration(minutes: 1),
              workDuration: Duration(minutes: 15),
            ),
          ],
          repeatNum: 3,
        );

  final String name;
  final String description;
  final List<Action> actions;
  final int repeatNum;

  Routine copyWith({
    String? name,
    String? description,
    List<Action>? actions,
    int? repeatNum,
  }) =>
      Routine(
        name: name ?? this.name,
        description: description ?? this.description,
        actions: actions ?? this.actions,
        repeatNum: repeatNum ?? this.repeatNum,
      );

  @override
  List<Object?> get props => [name, description, actions, repeatNum];
}

class Action extends Equatable {
  const Action({
    required this.name,
    required this.readyDuration,
    required this.workDuration,
  });

  const Action.initial()
      : this(
          name: 'action',
          readyDuration: const Duration(seconds: 3),
          workDuration: const Duration(seconds: 5),
        );

  final String name;
  final Duration readyDuration;
  final Duration workDuration;

  Action copyWith({
    String? name,
    Duration? readyDuration,
    Duration? workDuration,
  }) =>
      Action(
        name: name ?? this.name,
        readyDuration: readyDuration ?? this.readyDuration,
        workDuration: workDuration ?? this.workDuration,
      );

  @override
  List<Object?> get props => [name, readyDuration, workDuration];
}

class TimerState extends Equatable {
  const TimerState({
    required this.routines,
    required this.currentRoutineIndex,
    required this.completionCount,
    required this.currentActionIndex,
    required this.isWorkTime,
    required this.elapsedTime,
    required this.isMoving,
  });

  TimerState.initial()
      : this(
          routines: [
            const Routine.training(),
            const Routine.study(),
          ],
          currentRoutineIndex: 0,
          completionCount: 0,
          currentActionIndex: 0,
          isWorkTime: false,
          elapsedTime: Duration.zero,
          isMoving: false,
        );

  final List<Routine> routines;
  final int currentRoutineIndex;
  final int completionCount;
  final int currentActionIndex;
  final bool isWorkTime;
  final Duration elapsedTime;
  final bool isMoving;

  bool get isDone => completionCount == currentRoutine.repeatNum;

  Routine get currentRoutine => routines[currentRoutineIndex];

  Action get currentAction => currentRoutine.actions[currentActionIndex];

  Duration get currentActionDuration =>
      isWorkTime ? currentAction.workDuration : currentAction.readyDuration;

  TimerState get nextState {
    final actionMaxIndex = currentRoutine.actions.length - 1;
    final completionCount = currentActionIndex == actionMaxIndex && isWorkTime
        ? this.completionCount + 1
        : this.completionCount;
    final isDone = completionCount == currentRoutine.repeatNum;
    late int newActionIndex;
    if (!isDone && isWorkTime) {
      newActionIndex =
          currentActionIndex == actionMaxIndex ? 0 : currentActionIndex + 1;
    } else {
      newActionIndex = currentActionIndex;
    }

    return copyWith(
      completionCount: completionCount,
      currentActionIndex: newActionIndex,
      isWorkTime: !isWorkTime || isDone,
      elapsedTime: Duration.zero,
      isMoving: !isDone,
    );
  }

  TimerState updateAction({
    required int routineIndex,
    required int actionIndex,
    required Action newAction,
  }) {
    // Copy current [actions]
    final newActions = [...routines[routineIndex].actions];
    // Replace [action] in [newActions] with a [newAction]
    newActions[actionIndex] = newAction;

    // Copy current [routines]
    final newRoutines = [...routines];
    // Replace [routine] in [newRoutines] with a [newAction]
    newRoutines[routineIndex] =
        routines[routineIndex].copyWith(actions: newActions);

    return copyWith(
      routines: newRoutines,
    );
  }

  TimerState updateRepeatNum({
    required int routineIndex,
    required int newRepeatNum,
  }) {
    // copy current routines
    final newRoutines = [...routines];
    // Replace [routine] in [newRoutines] with a new [routine]
    newRoutines[routineIndex] =
        newRoutines[routineIndex].copyWith(repeatNum: newRepeatNum);
    return copyWith(
      routines: newRoutines,
    );
  }

  TimerState get start => copyWith(isMoving: true);

  TimerState get stop => copyWith(isMoving: false);

  TimerState get resetCounter =>
      copyWith(currentActionIndex: 0, completionCount: 0, isWorkTime: false);

  TimerState get resetElapsedTime => copyWith(elapsedTime: Duration.zero);

  String currentActionToString() {
    if (isDone) {
      return 'finish!';
    } else {
      return currentAction.name;
    }
  }

  TimerState copyWith({
    List<Routine>? routines,
    int? currentRoutineIndex,
    int? completionCount,
    int? currentActionIndex,
    bool? isWorkTime,
    Duration? elapsedTime,
    bool? isMoving,
  }) =>
      TimerState(
        routines: routines ?? this.routines,
        currentRoutineIndex: currentRoutineIndex ?? this.currentRoutineIndex,
        completionCount: completionCount ?? this.completionCount,
        currentActionIndex: currentActionIndex ?? this.currentActionIndex,
        isWorkTime: isWorkTime ?? this.isWorkTime,
        elapsedTime: elapsedTime ?? this.elapsedTime,
        isMoving: isMoving ?? this.isMoving,
      );

  @override
  List<Object?> get props => [
        routines,
        currentRoutineIndex,
        completionCount,
        currentActionIndex,
        isWorkTime,
        elapsedTime,
        isMoving,
      ];
}
