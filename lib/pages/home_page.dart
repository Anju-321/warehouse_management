import 'package:flutter/material.dart';
import 'package:ware_house_management/components/app_bar.dart';
import 'package:ware_house_management/components/app_bargraph.dart';
import 'package:ware_house_management/components/app_button.dart';
import 'package:ware_house_management/components/arch_painter.dart';
import 'package:ware_house_management/components/color.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize:
            Size.fromHeight(100.0), // Set the preferred height of the app bar
        child: CustomAppBar(
          text: 'User Name',
          color: Colors.white,
          avatarIcon: Icon(Icons.person, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Stack(children: [
            SizedBox(
                height: 400,
                width: double.infinity,
                child: CustomPaint(
                  painter: ArchPainter(),
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1,
                  mainAxisSpacing: 6.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.star,
                        size: 50,
                        color: Colors.yellow,
                      ));
                },
              ),
            )
          ]),
          Container(
            height: 300,
            child: BarChartSample2(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("Warehouse_select");
                },
                child: const AppButton(
                    text: "Transfer",
                    bgcolor: blackClr,
                    size: 30,
                    txtClr: Colors.white,
                    height: 60,
                    width: 150),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("Product_select");
                  },
                  child: const AppButton(
                      text: "Return",
                      bgcolor: blackClr,
                      size: 30,
                      txtClr: Colors.white,
                      height: 60,
                      width: 150)),
            ],
          ),
        ],
      ),
    );
  }
}
