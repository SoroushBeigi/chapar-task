part of 'list_bloc.dart';

class ListState {
  final ListStatus listStatus;
  ListState({required this.listStatus});

  ListState copyWith({ListStatus? newStatus}) {
    return ListState(
      listStatus: newStatus ?? listStatus,
    );
  }
}
