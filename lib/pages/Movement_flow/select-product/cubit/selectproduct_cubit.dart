import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ware_house_management/Model/stockselect.dart';
import 'package:ware_house_management/Services/api.dart';
import 'package:ware_house_management/Urls/url.dart';
import 'package:ware_house_management/pages/Login/cubit/login_cubit.dart';

import 'package:ware_house_management/pages/Movement_flow/select-warehouse/cubit/selectwarehouse_cubit.dart';
import 'package:ware_house_management/pages/success_page.dart';

part 'selectproduct_state.dart';

List<String> selectedIds = [];

class SelectproductCubit extends Cubit<SelectproductState> {
  final String? loginUserId;
  SelectproductCubit(this.context, {required this.loginUserId}) : super(SelectproductstockInitial()) {
    getData();
  }

  BuildContext context;
  getData() async {
    debugPrint(" warehouseid check $fromWarehouseid");
    final response = await Api.call(context,
        endPoint: "$stockUrl/$fromWarehouseid", method: Method.get);
    debugPrint(" api response  $response");

    if (response.status) {
      final List<StockEntry> stockEntries = List<StockEntry>.from(
        (response.data['stockEntries'] as List<dynamic>).map(
          (item) => StockEntry.fromJson(item),
        ),
      );

      productsData = stockEntries;

      emit(StockData(data: stockEntries));
    } else {
      debugPrint("Response status is false");
    }
  }

  // checkboxSelect(StockEntry stocks) async {
  //   stocks.isSelected = !stocks.isSelected;

  //   if (stocks.isSelected &&
  //       stocks.txtCtrl!.text.isNotEmpty &&
  //       stocks.id.isNotEmpty) {
  //     // Add selected product to the products list
  //     products.add({"product": stocks.id, "quantity": stocks.txtCtrl!.text});
  //   } else {
  //     // Remove unselected product from the products list
  //     products.removeWhere((product) => product["product"] == stocks.id);
  //   }

  //   debugPrint(products.toString());
  //   emit(StockData(data: (state as StockData).data));
  // }

  checkboxSelect(StockEntry stocks) async {
    stocks.isSelected = !stocks.isSelected;

    if (stocks.isSelected &&
        stocks.txtCtrl!.text.isNotEmpty &&
        stocks.id.isNotEmpty) {
      // Add selected product to the products list
      products.add({
        "product": stocks.product!.id,
        "quantity": stocks.txtCtrl!.text,
      });
    } else {
      // Remove unselected product from the products list
      products.removeWhere((product) => product["product"] == stocks.id);
    }

    debugPrint(products.toString());
    emit(StockData(data: (state as StockData).data));
  }

  List<Map<String, dynamic>> products = [];

  List<StockEntry> productsData = [];

  submitData() async {
    // final List<Map<String, dynamic>> selectedProducts = products
    //     .where((product) =>
    //         product["product"].isNotEmpty && product["quantity"].isNotEmpty)
    //     .toList();

    // Remove empty product entries
    final List<Map<String, dynamic>> selectedProducts = products
        .where((product) =>
            product["product"].isNotEmpty && product["quantity"].isNotEmpty)
        .toList();
    // selectedIds.clear();
    debugPrint(" body of list product $products");
    debugPrint("user id from login $loginuserId");
    
    final body = {
      "products": selectedProducts,
      "sourceWarehouse": "$fromWarehouseid",
      "destinationWarehouse": "$toWarehouseid",
      "movementType": "Transfer",
      // "userId": "$loginuserId"
      "userId":"65780c276dc5097f32e0014a"
    };


    debugPrint(body.toString());
    final res = await Api.call(context,
        endPoint: movementUrl, method: Method.post, body: body);
    if (res.status) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SuccessPage()));
    }
  }

 
}

class SelectproductInitial {}
