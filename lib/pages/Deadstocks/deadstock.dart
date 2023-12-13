import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ware_house_management/Model/deadstockmodel.dart';
import 'package:ware_house_management/components/app_bar.dart';
import 'package:ware_house_management/components/app_text.dart';
import 'package:ware_house_management/components/bottomnav.dart';

import 'package:ware_house_management/pages/Deadstocks/cubit/deadstocks_cubit.dart';

// class DeadStocks extends StatelessWidget {
//   const DeadStocks({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Deadstocks'),
//       ),
//       body: BlocProvider(
//         create: (context) => DeadstocksCubit(context)..getDeadstock(),
//         child: BlocBuilder<DeadstocksCubit, DeadstocksState>(
//           builder: (context, state) {
//             if (state is DeadstockLoaded) {
//               return DataTable(
//                   columns: const [
//                     DataColumn(label: Text('Return From')),
//                     DataColumn(label: Text('Product')),
//                     DataColumn(label: Text('Quantity')),
//                   ],
//                   rows: List.generate(state.data!.length, (index) {
//                     final reversedIndex = state.data!.length - 1 - index;
//                     final details = state.data![reversedIndex];
//                     final warehouse = details.warehouse.warehousename;

//                     // final productlength=details.product.length;
//                     // // final warehouse = details.warehouse.warehousename;
//                     // ProductData product=details.product[productlength];

//                     return DataRow(
//                       cells: [
//                         DataCell(
//                             AppText(text: warehouse, color: Colors.red)),
//                         DataCell(
//                             AppText(text: warehouse, color: Colors.red)),
//                         DataCell(
//                             AppText(text: warehouse, color: Colors.red)),
//                       ],
//                     );
//                   }));
//             } else if (state is DeadstocksError) {
//               return Center(child: Text('Error: ${state.error}'));
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
class DeadStocksTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize:
            Size.fromHeight(100.0), // Set the preferred height of the app bar
        child: CustomAppBar(
          text: 'Deadstock',
          color: Colors.white,
          
        ),
      ),
      body: BlocProvider(
        create: (context) => DeadstocksCubit(context),
        child: BlocBuilder<DeadstocksCubit, DeadstocksState>(
          builder: (context, state) {
            if (state is DeadstockLoaded) {
              return DataTable(
                  columns: const [
                    DataColumn(label: Text('From', style: TextStyle(fontSize: 18),)),
                    DataColumn(label: Text('Product', style: TextStyle(fontSize: 18))),
                    DataColumn(label: Text('Quantity', style: TextStyle(fontSize: 18))),
                  ],
                  rows: List.generate(state.data.length, (index) {
                    final data = state.data[index].warehouse.warehousename;
                    final product = state.data[index].product[0].product.productname;
                    final quantity = state.data[index].product[0].quantity;

                    //  final listData = data[index].data[index];

                    // // final warehouse = details.warehouse.warehousename;
                    // final product=details.product[]
                    return DataRow(
                      cells: [
                      DataCell(
                        AppText(text: data, color: Colors.red),
                      ),
                      DataCell(
                        AppText(text: product, color: Colors.red),
                      ),
                      DataCell(
                        AppText(text: '$quantity', color: Colors.red),
                      ),
                      // DataCell(
                      //   AppText(text: deadstock.quantity, color: Colors.red),
                      // ),
                      // DataCell(
                      //   AppText(text: warehouse, color: Colors.red),
                      // ),
                    ]);
                  }));
            } else if (state is DeadstocksError) {
              return Center(
                child: Text('Error loading data: ${state.error}'),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigations(),
    );
  }
}
