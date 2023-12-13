part of 'stocks_cubit.dart';

// @immutable
// abstract class StocksState {}

// class StocksInitial extends StocksState {}

// class StocksDataLoaded extends StocksState {
//   final StocksData data;

//   StocksDataLoaded({required this.data});
// }

// class StocksError extends StocksState {
//   final String error;

//   StocksError({required this.error});
// }
abstract class StocksState {}

class StocksInitial extends StocksState {}

class StocksDataLoaded extends StocksState {
  final List<Stock> stocks;

  StocksDataLoaded({required this.stocks});
}

class StocksError extends StocksState {
  final String error;

  StocksError({required this.error});
}