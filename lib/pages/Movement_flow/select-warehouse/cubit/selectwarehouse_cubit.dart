import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:ware_house_management/Model/warehousemodel.dart';

import 'package:ware_house_management/Services/api.dart';
import 'package:ware_house_management/Urls/url.dart';

part 'selectwarehouse_state.dart';

String? fromWarehouseid;
String? toWarehouseid;
String? movementType;

class SelectwarehouseCubit extends Cubit<SelectwarehouseState> {
  final bool isSelected;
  SelectwarehouseCubit(this.context, {this.isSelected = false})
      : super(SelectwarehouseInitial()) {
    updateWarehouseModel();
  }

  TextEditingController fromWarehouse = TextEditingController();
  TextEditingController toWarehouse = TextEditingController();

  BuildContext context;
  void updateWarehouseModel() async {
    try {
      final res =
          await Api.call(context, endPoint: warehouseUrl, method: Method.get);

      if (res.data is List<dynamic>) {
        final List<Datum> data =
            List<Datum>.from(res.data.map((item) => Datum.fromJson(item)));

        emit(MovementsData(data: data));
      }
    } catch (e) {
      // Handle exceptions if any
      // print('Error: $e');
    }
  }

//   updateValue(String value, String id) {

//     final currentData = (state as MovementsData).data;
//     emit(MovementsData(data: currentData, stateChange: value));
//     if (isSelected == true) {
//       fromWarehouseid= id;
//       debugPrint(' from warehouse $fromWarehouseid');
// //  debugPrint("from: ${fromWarehouse.text}");

//     } else {
//       toWarehouse.text = value;
//       toWarehouseid = id;
//        debugPrint(' towarehose $toWarehouseid');
//       //  debugPrint(toWarehouse.text);
//     }
//   }

  void updateValue(String value, String id, bool isSelected) {
    final currentData = (state as MovementsData).data;
    emit(MovementsData(data: currentData, stateChange: value));

    if (isSelected) {
      fromWarehouseid = id;
      debugPrint('From warehouse $fromWarehouseid');
    } else {
      toWarehouseid = id;
      debugPrint('To warehouse $toWarehouseid');
    }
  }
}
