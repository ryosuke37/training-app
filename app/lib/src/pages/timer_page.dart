import 'package:app/src/component/repetition_timer/repetition_timer.dart';
import 'package:app/src/component/repetition_timer/routine_setter.dart';
import 'package:app/src/component/repetition_timer/timer_bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizer/localizer.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.timer),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.alarm),
              ),
              Tab(
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        body: BlocProvider<TimerBloc>(
          create: (context) => TimerBloc(),
          child: const TabBarView(
            children: <Widget>[
              Center(
                child: RepetitionTimer(),
              ),
              Center(
                child: RoutineSetter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
