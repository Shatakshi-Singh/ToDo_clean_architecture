import 'package:flutter/foundation.dart';

abstract class StateMachine<State, Event> {
  late State _state; //'late' define later
  StateMachine(State initialState) {
    this._state = initialState;
  }

  @protected
  State getStateOnEvent(Event event);

  State onEvent(Event event) {
    this._state = getStateOnEvent(event);
    return _state; //takes new event and returns corresponding state
  }

  State getCurrentState() {
    return _state;
  }
}
