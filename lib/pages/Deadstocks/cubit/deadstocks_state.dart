part of 'deadstocks_cubit.dart';

@immutable
sealed class DeadstocksState {}

final class DeadstocksInitial extends DeadstocksState {}

final class DeadstockLoaded extends DeadstocksState {
  List<DeadStock> data;
  DeadstockLoaded({required this.data});
}

class DeadstocksError extends DeadstocksState {
  final String error;

  DeadstocksError({required this.error});
}
