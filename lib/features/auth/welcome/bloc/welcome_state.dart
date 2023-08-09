part of 'welcome_bloc.dart';

@immutable
class WelcomeState {
  final int pageCount;
  const WelcomeState(this.pageCount);
}

class WelcomeIncrementState extends WelcomeState {
  const WelcomeIncrementState(super.pageCount);
}

class WelcomeNavigateToMeetingPageState extends WelcomeState {
  const WelcomeNavigateToMeetingPageState() : super(0);
}
