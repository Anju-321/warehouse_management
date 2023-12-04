import 'package:flutter/material.dart';
import 'package:ware_house_management/components/app_button.dart';
import 'package:ware_house_management/components/app_text.dart';
import 'package:ware_house_management/components/color.dart';
import 'package:ware_house_management/components/warehose_dropdown.dart';

List<String>? selectedItem = [];

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  late Map<String, bool> isCheckedMap;
  late Map<String, TextEditingController> quantityControllers;
  List<String> stocks = [
    "Laptop",
    "Mobile",
    "TV",
    "Car",
    "Bus",
    "Wallet",
    "Watch",
    "Flower",
    "Chair",
    "Grainter",
    "Ring",
    "Dress",
  ];
  List<String> originalStocks = [
    "Laptop",
    "Mobile",
    "TV",
    "Car",
    "Bus",
    "Wallet",
    "Watch",
    "Flower",
    "Chair",
    "Grainter",
    "Ring",
    "Dress",
  ];

  final searchController = TextEditingController();
  bool showFilteredResults = false;

  @override
  void initState() {
    super.initState();
    isCheckedMap =
        Map.fromIterable(stocks, key: (item) => item, value: (item) => false);

    quantityControllers = Map.fromIterable(
      stocks,
      key: (item) => item,
      value: (item) => TextEditingController(),
    );
  }

  List<String> getFilteredStocks(String query) {
    return originalStocks
        .where((stock) => stock.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<String> displayedStocks =
        showFilteredResults ? getFilteredStocks(searchController.text) : stocks;

    return Scaffold(
        body: Column(
      children: [
        Container(
          decoration: const BoxDecoration(color: blackClr),
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const AppText(text: "Stocks", color: whiteClr),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 50),
                child: Column(
                  children: [
                    AppText(text: "From :$warehouseFromItems", color: whiteClr),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/6368/6368561.png"),
                      radius: 15,
                    ),
                    AppText(text: "To :$warehouseToItems", color: whiteClr),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: "Search"),
            onChanged: (query) {
              setState(() {
                showFilteredResults = query.isNotEmpty;
                stocks = getFilteredStocks(query);
              });
            },
            controller: searchController,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                itemCount: displayedStocks.length,
                itemBuilder: (context, index) {
                  String product = displayedStocks[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                          value: isCheckedMap[product],
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckedMap[product] = value!;

                              if (!value) {
                                quantityControllers[product]!.clear();
                              }
                            });
                            selectedItem?.add(product);
                          }),
                      trailing: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 50,
                        width: 50,
                        child: TextField(
                          controller: quantityControllers[product],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Quantity",
                          ),
                        ),
                      ),
                      title: Text(product),
                      subtitle:
                          Text(quantityControllers[product]!.text.toString()),
                    ),
                  );
                },
              ),
              const Positioned(
                bottom: 20,
                right: 30,
                child: AppButton(
                  text: "Submit",
                  bgcolor: blackClr,
                  size: 16,
                  txtClr: whiteClr,
                  height: 50,
                  width: 150,
                  navigator: 'success',
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
