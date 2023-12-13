import 'package:flutter/material.dart';

import 'package:ware_house_management/components/app_bar.dart';
import 'package:ware_house_management/components/app_button.dart';

import 'package:ware_house_management/components/color.dart';
import 'package:ware_house_management/pages/Movement_flow/select-warehouse/cubit/selectwarehouse_cubit.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  List<String> homeScreen = [
    "Total Stock",
    // "Warehouses",
    "Recent Activity",
    "Dead Stock"
  ];

  List<String> redirectingList = [
    'stocks_details',
    // 'warehouse_details',
    'movement_history',
    'deadstocks_details'
  ];

  List<Icon> iconlist = [
    const Icon(
      Icons.inventory,
      size: 100.0, // Adjust the size as needed
      color: Colors.blue, // Customize the color
    ),
    const Icon(
      Icons.history,
      size: 100.0,
      color: Colors.green,
    ),
    const Icon(
      Icons.inventory,
      size: 100.0, // Adjust the size as needed
      color: Colors.red, // Customize the color
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize:
            Size.fromHeight(100.0), // Set the preferred height of the app bar
        child: CustomAppBar(
          text: "Home",
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2, crossAxisCount: 1),
                      itemCount: 3,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, redirectingList[index]);
                        },
                        child: Card(
                          child: Center(
                            child: Column(
                              children: [
                                iconlist[index],
                                Text(
                                  homeScreen[index],
                                  style: const TextStyle(
                                      fontSize: 35, color: silveClr),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          movementType = "Transfer";
                          Navigator.pushNamed(context, "warehouse_select");
                        },
                        child: const AppButton(
                          text: "Transfer",
                          bgcolor: blackClr,
                          size: 18,
                          txtClr: whiteClr,
                          height: 50,
                          width: 150,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          movementType = "Return";
                          Navigator.pushNamed(context, "warehouse_select");
                        },
                        child: const AppButton(
                            text: "Return",
                            bgcolor: blackClr,
                            size: 18,
                            txtClr: whiteClr,
                            height: 50,
                            width: 150),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const BottomNavigations(),
    );
  }
}
