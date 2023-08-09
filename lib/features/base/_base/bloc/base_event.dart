// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'base_bloc.dart';

@immutable
abstract class BaseEvent {
  final int pageIndex;
  const BaseEvent({
    required this.pageIndex,
  });
}

class BasePageIndexChangedEvent extends BaseEvent {
  const BasePageIndexChangedEvent({required super.pageIndex});
}
