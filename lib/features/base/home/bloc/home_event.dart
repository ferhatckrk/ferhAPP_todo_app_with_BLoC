part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoadAllTodosEvent extends HomeEvent {}

class HomeSearchingEvent extends HomeEvent {
  final String searchInputText;
  const HomeSearchingEvent(this.searchInputText);
}
