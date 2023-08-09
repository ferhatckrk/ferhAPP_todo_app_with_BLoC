import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(const WelcomeState(0)) {
    on<WelcomeIncrementEvent>(_onWelcomeEvent);
    on<WelcomeNavigateToMeetingPageEvent>(_onNavigateToMeetingPageEvent);
  }
  FutureOr<void> _onWelcomeEvent(
      WelcomeIncrementEvent event, Emitter<WelcomeState> emit) {
    emit(WelcomeIncrementState(state.pageCount + 1));
    print(state.pageCount);
  }

  FutureOr<void> _onNavigateToMeetingPageEvent(
      WelcomeNavigateToMeetingPageEvent event, Emitter<WelcomeState> emit) {
    emit(const WelcomeNavigateToMeetingPageState());
  }
}
