import 'package:flutter/material.dart';
import 'package:ware_house_management/components/app_bar.dart';
import 'package:ware_house_management/components/app_button.dart';
import 'package:ware_house_management/components/color.dart';

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  late Map<String, bool> isCheckedMap;
  List<String> stocks = ["Laptop", "Mobile", "TV", "car","bus","cycle","Auto","watch","wallet","bag"];
  List<int> quantity =[20,30,50,20,30,50,20,30,50,20,];

  @override
  void initState() {
    super.initState();
    isCheckedMap = Map.fromIterable(stocks, key: (item) => item, value: (item) => false);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:   const PreferredSize(
        preferredSize:
            Size.fromHeight(50.0),
        child: CustomAppBar(
          text: 'Stocks',
          color: Colors.white,
          // avatarIcon: Icon(Icons.person, color: Colors.black),
   ),
),
      body: Stack(
        children:[ ListView.builder(
          itemCount: stocks.length,
          itemBuilder: (context, index) {
            String product = stocks[index];
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                child: ListTile(
                  leading: Checkbox(
                    value: isCheckedMap[product],
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedMap[product] = value!;
                      });
                    },
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 50,
                    width: 50,
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Quantity",
                      ),
                    ),
                  ),
                  title: Text(product),
                  subtitle: Text(quantity[index].toString()),
                ),
              ),
            );
          },
        ),
   const  Positioned(
      bottom: 20,
      right: 30,
      child:   AppButton(text: "Submit", bgcolor: blackClr, size: 16, txtClr: whiteClr, height: 50, width: 150)
       ) ]
      ),
    );
  }
}