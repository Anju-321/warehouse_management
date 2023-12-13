import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ware_house_management/Model/movementhistoryitem.dart';
import 'package:ware_house_management/Services/api.dart';
import 'package:ware_house_management/Urls/url.dart';

part 'movmenthistory_state.dart';

class MovmenthistoryCubit extends Cubit<MovmenthistoryState> {
  MovmenthistoryCubit(this.context) : super(MovmenthistoryInitial()) {
    getmovment();
  }

  final BuildContext context;

  getmovment() async {
    try {
      final response =
          await Api.call(context, endPoint: movementUrl, method: Method.get);
      debugPrint("getmovement data ${response.data}");
      if (response.data is List<dynamic>) {
        final List<MovementHistoryData> data = List<MovementHistoryData>.from(
            response.data.map((item) => MovementHistoryData.fromJson(item)));
        debugPrint("getmovement data $data");
        emit(MovmenthistoryLoaded(movementdata:data));
      }

      // final data = MovementHistoryData.fromJson(json.decode(response.data));
    } catch (e) {
      debugPrint("$e");
    }
  }
}
