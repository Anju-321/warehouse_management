import 'package:flutter/material.dart';
import 'package:ware_house_management/components/app_bar.dart';
import 'package:ware_house_management/components/bottomnav.dart';
import 'package:ware_house_management/components/color.dart';

import 'package:ware_house_management/pages/MovementPage/stocks.dart';

class ProductHistory extends StatelessWidget {
  const ProductHistory({Key? key}) : super(key: key);

  // Mocking a future that returns a list of items
  Future<List<String>> fetchData() async {
    // You would typically replace this with an actual data-fetching logic
    await Future.delayed(const Duration(seconds: 2));
    return selectedItem ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width * 1,
              MediaQuery.of(context).size.height * 0.15),
          child:
              const CustomAppBar(text: "Transaction ProductHistory", color: whiteClr)),
      body: FutureBuilder<List<String>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the data, show a loading indicator
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // If there's an error, show an error message
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // If the data is successfully fetched, build the ListView
            final List<String> historyItems = snapshot.data ?? [];
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: historyItems.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(historyItems[index]),
                     
                      trailing: const Text("50"),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
      // bottomNavigationBar: const BottomNavigations(),
    );
  }
}
