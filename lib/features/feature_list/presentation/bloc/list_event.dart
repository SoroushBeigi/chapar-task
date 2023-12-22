part of 'list_bloc.dart';

sealed class ListEvent {}

class LoadListEvent extends ListEvent{}

class CallEvent extends ListEvent{
  final String phoneNumber;
  CallEvent({required this.phoneNumber});
}
