// import 'package:flutter/material.dart';
// import 'package:ware_house_management/components/bottomnav.dart';
// import 'package:ware_house_management/components/warehose_dropdown.dart';

// class History extends StatelessWidget {
//   const History({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(itemBuilder: (context,index)=>GestureDetector(
//         onTap: (){
//           Navigator.of(context).pushNamed("producthistory");
//           debugPrint("Hii");
//         },
//         child: ListTile(
//           title: Text("$warehouseFromItems  userid:"),
//           subtitle: Text("date: 10/10/2023 $warehouseToItems"),
//         ),
//       ),
//       ),
//      bottomNavigationBar:const BottomNavigations(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ware_house_management/components/warehose_dropdown.dart';

class History extends StatelessWidget {
  const History({super.key});
  // Future<List<String>> getData()async{
  //   await Future.delayed(const Duration(seconds: 2));
  //   return {};

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // FutureBuilder(future: getData(), builder: (context ,AsyncSnapshot snapshot)=>
          ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed("producthistory");
          },
          child: ListTile(
            title: Text("$warehouseFromItems"),
            subtitle: Text("$warehouseToItems")
          ),
        ),
      ),
      // ),
    );
  }
}
