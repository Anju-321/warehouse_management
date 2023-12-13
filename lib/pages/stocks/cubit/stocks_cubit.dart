// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:ware_house_management/Model/stocksdata.dart';
// import 'package:ware_house_management/Services/api.dart';
// import 'package:ware_house_management/Urls/url.dart';

// part 'stocks_state.dart';

// class StocksCubit extends Cubit<StocksState> {
//   StocksCubit(this.context) : super(StocksInitial()) {
//     getStocks();
//   }
//   final BuildContext context;

//   Future<void> getStocks() async {
//     try {
//       final response = await Api.call(context, endPoint: stocksUrl, method: Method.get);

//       if (response.data is Map<String, dynamic>) {
//         final StocksData stocksData = StocksData.fromJson(response.data);
//         emit(StocksDataLoaded(stocks: stocksData.data));
//       }
//     } catch (e) {
//       emit(StocksError(error: "$e"));
//     }
//   }

  
// }

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ware_house_management/Model/stocksdata.dart';
import 'package:ware_house_management/Services/api.dart';
import 'package:ware_house_management/Urls/url.dart';

part 'stocks_state.dart';

class StocksCubit extends Cubit<StocksState> {
  StocksCubit(this.context) : super(StocksInitial()) {
    getStocks();
  }

  final BuildContext context;

  Future<void> getStocks() async {
    try {
      final response = await Api.call(context, endPoint: stocksUrl, method: Method.get);

      if (response.data is List<dynamic>) {
        final List<Stock> stocksList = List<Stock>.from(response.data.map((item) => Stock.fromJson(item)));
        emit(StocksDataLoaded(stocks: stocksList));
      } else {
        throw Exception("Invalid response format");
      }
    } catch (e) {
      emit(StocksError(error: "$e"));
    }
  }
}
