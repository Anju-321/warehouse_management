import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:ware_house_management/Model/deadstockmodel.dart';
import 'package:ware_house_management/Services/api.dart';
import 'package:ware_house_management/Urls/url.dart';

part 'deadstocks_state.dart';

class DeadstocksCubit extends Cubit<DeadstocksState> {
  DeadstocksCubit(this.context) : super(DeadstocksInitial()) {
    getDeadstock();
  }
  final BuildContext context;

 getDeadstock() async {
  
     final response = await Api.call(context, endPoint: deadstockUrl, method: Method.get);

  if (response.data is List<dynamic>) {
        final List<DeadStock> data = List<DeadStock>.from(
            response.data.map((item) => DeadStock.fromJson(item)));
        emit(DeadstockLoaded(data: data));
      }

 }}
