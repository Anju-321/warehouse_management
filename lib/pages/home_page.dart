import 'package:flutter/material.dart';
import 'package:ware_house_management/components/app_button.dart';
import 'package:ware_house_management/components/bottomnav.dart';
import 'package:ware_house_management/components/color.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});
  List<String> homeScreen = ["Total Stock","Warehouses","Recent Activity","Dead Stock"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: blackClr),
            height: 150,
            width: 500,
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
              ],
            ),
          ),
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
                            childAspectRatio: 1.5,
                              crossAxisCount: 2),
                      itemCount: 4,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){},
                        child: Card(
                          
                          child: Center(
                            child: Text(homeScreen[index],style:const TextStyle(
                              fontSize: 20,color: silveClr
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                 const Padding(
                  padding:EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                          text: "Transfer",
                          bgcolor: blackClr,
                          size: 18,
                          txtClr: whiteClr,
                          height: 50,
                          width: 150, navigator: 'warehouse',),
                      AppButton(
                          text: "Return",
                          bgcolor: blackClr,
                          size: 18,
                          txtClr: whiteClr,
                          height: 50,
                          width: 150, navigator: '',)
                    ],
                  ),
                ),
              ]),
            ),
          ),
   
        ],
      ),
      bottomNavigationBar: BottomNavigations(),
    );
  }
}
