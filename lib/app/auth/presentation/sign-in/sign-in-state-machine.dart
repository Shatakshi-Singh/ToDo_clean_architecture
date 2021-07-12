import 'package:clean_architecture_todo/core/presentation/state-machine.dart';

class SignInStateMachine extends StateMachine<SignInState, SignInEvent> {
  SignInStateMachine() : super(SignInInitState()); //Initialised state

  @override
  SignInState getStateOnEvent(SignInEvent event) {
    final eventType = event.runtimeType; //shows the running event
    SignInState newState = getCurrentState();
    switch (eventType) {
      case SignInClickEvent:
        newState = SignInLoadingState();
        break; 
      case SignInErrorEvent:
        SignInErrorEvent errorEvent = event as SignInErrorEvent;
        newState = SignInErrorState(
            email: errorEvent.email, password: errorEvent.password);
        break;
      default:
        throw ('Invalid State: SignInStateMachine');
    } //event ke according state manipulate
    return newState;
  }
}

abstract class SignInState {} //2

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {
  final String email;
  final String password;

  SignInErrorState({required this.email, required this.password});
}

class SignInInitState extends SignInState {}

abstract class SignInEvent {} //1

class SignInClickEvent extends SignInEvent {}

class SignInErrorEvent extends SignInEvent {
  final String email;
  final String password;

  SignInErrorEvent({required this.email, required this.password});
}
