// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:ware_house_management/components/app_text.dart';
// import 'package:ware_house_management/pages/Movement/cubit/movmenthistory_cubit.dart';
// import 'package:ware_house_management/pages/Movement/movementhistorydetails.dart';

// class MovementHistory extends StatelessWidget {
//   const MovementHistory({
//     Key? key,
//   }) : super(key: key);
//   // final List<MovementHistoryItem> movementHistory;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Movement History'),
//       ),
//       body: BlocProvider(
//         create: (context) => MovmenthistoryCubit(context),
//         child: BlocBuilder<MovmenthistoryCubit, MovmenthistoryState>(
//           builder: (context, state) {
//             if (state is MovmenthistoryLoaded) {
//               return DataTable(
//                 border: TableBorder.all(width: 1),
//                 columns: const [
//                   DataColumn(label: Text('From')),
//                   DataColumn(label: Text('To')),
//                   DataColumn(label: Text('Date')),
//                 ],
//                 rows: List.generate(state.data!.length, (index) {
//                   // final details = state.data![index];
//                   final reversedIndex = state.data!.length - 1 - index;
//                   final details = state.data![reversedIndex];

//                   final sourcewarehourse =
//                       details.sourceWarehouse.warehousename;
//                   final deswarehourse =
//                       details.destinationWarehouse.warehousename;
//                   final productList = details.products;
//                   final userName = details.userId.username;

//                   final timestampInIST =
//                       convertToIST(details.timestamp.toString());

//                   return DataRow(
//                       onLongPress: () {
//                         // Navigate to the DetailsPage and pass the details
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DetailsPage(
//                                 sourceWarehourse: sourcewarehourse,
//                                 destinationWarehourse: deswarehourse,
//                                 timestampInIST: timestampInIST,
//                                 productList: productList,
//                                 userName: userName,
//                               ),
//                             ));
//                       },
//                       cells: [
//                         DataCell(
//                           AppText(text: sourcewarehourse, color: Colors.red),
//                         ),
//                         DataCell(
//                           AppText(text: deswarehourse, color: Colors.red),
//                         ),
//                         DataCell(
//                           AppText(text: timestampInIST, color: Colors.red),
//                         ),
//                       ]);
//                 }),
//               );
//             }
//             return const Center(
//               child: CupertinoActivityIndicator(),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   // Function to convert timestamp to IST
//   String convertToIST(String timestamp) {
//     final DateTime dateTime = DateTime.parse(timestamp);
//     final indianTime = DateFormat.yMd().add_jms().format(
//           dateTime.toLocal().add(
//                 const Duration(
//                     hours: 5,
//                     minutes: 30), // Add 5 hours and 30 minutes for IST
//               ),
//         );
//     return indianTime;
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ware_house_management/components/app_bar.dart';
import 'package:ware_house_management/components/app_text.dart';
import 'package:ware_house_management/components/bottomnav.dart';
import 'package:ware_house_management/pages/Movement/cubit/movmenthistory_cubit.dart';
import 'package:ware_house_management/pages/Movement/movementhistorydetails.dart';

class MovementHistory extends StatelessWidget {
  const MovementHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize:
            Size.fromHeight(100.0), // Set the preferred height of the app bar
        child: CustomAppBar(
          text: 'Movement History',
          color: Colors.white,
          
        ),
      ),
      body: BlocProvider(
        create: (context) => MovmenthistoryCubit(context),
        child: BlocBuilder<MovmenthistoryCubit, MovmenthistoryState>(
          builder: (context, state) {
            if (state is MovmenthistoryLoaded) {
              return ListView.builder(
                itemCount: state.movementdata!.length,
                itemBuilder: (context, index) {
                  final reversedIndex = state.movementdata!.length - 1 - index;
                  final details = state.movementdata![reversedIndex];

                  final sourceWarehourse =
                      details.sourceWarehouse.warehousename;
                  final desWarehourse =
                      details.destinationWarehouse.warehousename;
                  final productList = details.products;
                  final userName = details.userId.username;

                  final timestampInIST =
                      convertToIST(details.timestamp.toString());

                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    elevation: 2.0,
                    color:Colors.grey[200],
                    child: ListTile(
                      
                      title: AppText(text: 'From: $sourceWarehourse', color: Colors.black,),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(text: 'To: $desWarehourse',color: Colors.black,),
                          AppText(text: 'Date: $timestampInIST',color: Colors.black,),
                        ],
                      ),
                      onTap: () {
                        // Handle tap event, e.g., navigate to details page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              sourceWarehourse: sourceWarehourse,
                              destinationWarehourse: desWarehourse,
                              timestampInIST: timestampInIST,
                              productList: productList,
                              userName: userName,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
            return Center(
              child: CupertinoActivityIndicator(),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigations(),
    );
  }
  // Function to convert timestamp to IST
  String convertToIST(String timestamp) {
    final DateTime dateTime = DateTime.parse(timestamp);
    final indianTime = DateFormat.yMd().add_jms().format(
          dateTime.toLocal().add(
                const Duration(
                    hours: 5,
                    minutes: 30), // Add 5 hours and 30 minutes for IST
              ),
        );
    return indianTime;
  }
}
