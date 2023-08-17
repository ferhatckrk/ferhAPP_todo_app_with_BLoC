// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {}

class HomeSearchingState extends HomeState {
  final List<Todo> todoList;
  const HomeSearchingState(this.todoList);
}

class HomeErrorState extends HomeState {
  final String errorText;
  const HomeErrorState({
    required this.errorText,
  });
}
