import 'package:clean_architecture_todo/core/presentation/state-machine.dart';

class SignInStateMachine extends StateMachine<SignInState, SignInEvent> {
  SignInStateMachine() : super(SignInInitState());

  @override
  SignInState getStateOnEvent(SignInEvent event) {
    final eventType = event.runtimeType; //TODO shows the running event
    SignInState newState = getCurrentState();
    switch (eventType) {
      case SignInClickEvent:
        newState = SignInLoadingState();
        break;
      case SignInErrorEvent:
        SignInErrorEvent errorEvent = event as SignInErrorEvent;
        newState = SignInErrorState();
        break;
      default:
        throw ('Invalid State: SignInStateMachine');
    }
    return newState;
  }
}

abstract class SignInState {} //2

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {}

class SignInInitState extends SignInState {}

abstract class SignInEvent {} //1

class SignInClickEvent extends SignInEvent {}

class SignInErrorEvent extends SignInEvent {}
