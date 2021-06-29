//SplashScreenInitializationState instead of InitState

//for fetching from firebase Initialization State is used

import 'package:clean_architecture_todo/core/presentation/state-machine.dart';

class SplashScreenStateMachine
    extends StateMachine<SplashScreenState, SplashScreenEvent> {
  SplashScreenStateMachine() : super(SplashScreenInitializationState());
  @override
  SplashScreenState getStateOnEvent(SplashScreenEvent event) {
    final eventType = event.runtimeType;
    SplashScreenState newState = getCurrentState();
    switch (eventType) {
    }
    return newState;
  }
}

abstract class SplashScreenState {}

class SplashScreenInitializationState extends SplashScreenState {}

abstract class SplashScreenEvent {}
