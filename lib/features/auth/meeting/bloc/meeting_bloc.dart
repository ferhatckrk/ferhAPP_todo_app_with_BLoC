import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'meeting_event.dart';
part 'meeting_state.dart';

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  MeetingBloc() : super(MeetingState()) {
    on<MeetingNavigateToHomeEvent>(_onMeetingNavigateToHomeEvent);
  }

  FutureOr<void> _onMeetingNavigateToHomeEvent(
      MeetingNavigateToHomeEvent event, Emitter<MeetingState> emit) {
    emit(MeetingNavigateToBaseViewState());
  }
}
