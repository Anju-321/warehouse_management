



part of 'selectproduct_cubit.dart';

class SelectproductState {}

final class SelectproductstockInitial extends SelectproductState {}

final class StockData extends SelectproductState {
  List<StockEntry>? data;
  StockData({this.data});
}
final class CheckboxState extends SelectproductState{
  final bool isSelected;
 CheckboxState({this.isSelected = false});
}