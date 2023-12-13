// import 'package:flutter/material.dart';
// import 'package:ware_house_management/Model/movementhistoryitem.dart';

// class DetailsPage extends StatelessWidget {
//   final String sourceWarehourse;
//   final String destinationWarehourse;
//   final String timestampInIST;
//   final String userName;
//   final List<ProductElement> productList;

//   DetailsPage({
//     required this.sourceWarehourse,
//     required this.destinationWarehourse,
//     required this.timestampInIST,
//     required this.productList,
//     required this.userName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Details'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Source Warehouse: $sourceWarehourse'),
//             Text('Destination Warehouse: $destinationWarehourse'),
//             Text('Timestamp (IST): $timestampInIST'),
//             Text('Moved by $userName'),
//             // Text("Product $productName  Quantity- $quantity")

//             const SizedBox(height: 16.0), // Add some spacing
//             const Text(
//               'Product Details:',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: productList.length,
//                 itemBuilder: (context, index) {
//                   final product = productList[index];
//                   return ListTile(
//                     title: Text('Product Name: ${product.product.productname}'),
//                     subtitle: Text('Quantity: ${product.quantity}'),
//                     // Add more details as needed
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ware_house_management/Model/movementhistoryitem.dart';
import 'package:ware_house_management/components/app_bar.dart';
import 'package:ware_house_management/components/bottomnav.dart';

class DetailsPage extends StatelessWidget {
  final String sourceWarehourse;
  final String destinationWarehourse;
  final String timestampInIST;
  final String userName;
  final List<Product> productList;

  DetailsPage({
    required this.sourceWarehourse,
    required this.destinationWarehourse,
    required this.timestampInIST,
    required this.productList,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize:
            Size.fromHeight(100.0), // Set the preferred height of the app bar
        child: CustomAppBar(
          text: 'Details',
          color: Colors.white,
          
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200], // Set background color
          borderRadius: BorderRadius.circular(12.0), // Set border radius
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Source Warehouse: $sourceWarehourse',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              'Destination Warehouse: $destinationWarehourse',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              'Timestamp (IST): $timestampInIST',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              'Moved by $userName',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0), // Add some spacing
            Text(
              'Product Details:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Set box color
                      borderRadius: BorderRadius.circular(8.0), // Set border radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        'Product Name: ${product.product['productname']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      subtitle: Text(
                        'Quantity: ${product.quantity}',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      // Add more details as needed
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
       bottomNavigationBar: const BottomNavigations(),
    );
  }
}
