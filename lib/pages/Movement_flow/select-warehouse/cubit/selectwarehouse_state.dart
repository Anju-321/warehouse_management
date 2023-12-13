part of 'selectwarehouse_cubit.dart';

@immutable
sealed class SelectwarehouseState {}

final class SelectwarehouseInitial extends SelectwarehouseState {}
final class MovementsData extends SelectwarehouseState {
  List<Datum> data;
   String ?stateChange;

  MovementsData( {
    this.stateChange,
    required this.data
  });

}