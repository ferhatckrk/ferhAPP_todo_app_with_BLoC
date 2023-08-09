import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'base_event.dart';
part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(const BaseState(0)) {
    on<BasePageIndexChangedEvent>(_pageChangedEvent);
  }

  FutureOr<void> _pageChangedEvent(
      BasePageIndexChangedEvent event, Emitter<BaseState> emit) {
    emit(BaseState(event.pageIndex));
  }
}
