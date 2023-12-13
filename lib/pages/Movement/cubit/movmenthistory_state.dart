part of 'movmenthistory_cubit.dart';

sealed class MovmenthistoryState {}

final class MovmenthistoryInitial extends MovmenthistoryState {}

final class MovmenthistoryLoaded extends MovmenthistoryState {
  List<MovementHistoryData>? movementdata;
  MovmenthistoryLoaded({required this.movementdata});
}
