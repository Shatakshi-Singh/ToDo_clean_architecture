import 'package:clean_architecture_todo/core/presentation/state-machine.dart';

class SignUpStateMachine extends StateMachine<SignUpState, SignUpEvent> {
  SignUpStateMachine() : super(SignUpInitState());

  @override
  SignUpState getStateOnEvent(SignUpEvent event) {
    final eventType = event.runtimeType;
    SignUpState newState = getCurrentState();
    switch (eventType) {
      case SignUpClickEvent:
        newState = SignUpLoadingState();
        break;
      case SignUpErrorEvent:
        SignUpErrorEvent errorEvent = event as SignUpErrorEvent;
        newState = SignUpErrorState(
            email: errorEvent.email, password: errorEvent.password);

        
        break; 
      default:
        throw ('Invalid State: SignUpStateMachine');
    }
    return newState;
  }
}

abstract class SignUpState {} //2nd step

class SignUpLoadingState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String email;
  final String password;

  SignUpErrorState({required this.email, required this.password});
}

class SignUpInitState extends SignUpState {}

abstract class SignUpEvent {} //1st step

class SignUpClickEvent extends SignUpEvent {}

class SignUpErrorEvent extends SignUpEvent {
  final String email;
  final String password;

  SignUpErrorEvent({required this.email, required this.password});
}
