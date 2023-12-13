import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ware_house_management/Model/warehousemodel.dart';
import 'package:ware_house_management/pages/Movement_flow/select-warehouse/cubit/selectwarehouse_cubit.dart';

class Warehouses extends StatelessWidget {
  final bool? isSelected;
  Warehouses({super.key, this.isSelected});

  // String?selectedValue;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectwarehouseCubit(context),
      child: BlocBuilder<SelectwarehouseCubit, SelectwarehouseState>(
        builder: (context, state) {
          final cubit = context.read<SelectwarehouseCubit>();
          return state is MovementsData
              ?
              //  state is MovementsData==false?Text("data"):
              DropdownButton(
                  hint: const Text("Select Warehouse"),
                  value: state.stateChange,
                  onChanged: (String? newvalue) {
                    final selectedWarehouse = state.data.firstWhere(
                      (warehouse) => warehouse.warehousename == newvalue,
                      orElse: () => Datum(
                          warehousename: '',
                          id: ''), // Provide a default Datum if not found
                    );
                    cubit.updateValue(
                      selectedWarehouse.warehousename,
                      selectedWarehouse.id,
                       isSelected ?? false,
                      );
                  },
                  items: state.data.map((Datum value) {
                    return DropdownMenuItem<String>(
                      value: value.warehousename,
                      child: Text(value.warehousename),
                    );
                  }).toList())
              : const CupertinoActivityIndicator();
        },
      ),
    );
  }
}


