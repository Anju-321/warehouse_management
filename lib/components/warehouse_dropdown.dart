import 'package:flutter/material.dart';
import 'package:ware_house_management/components/app_text.dart';
import 'package:ware_house_management/components/color.dart';

class Warehouses extends StatefulWidget {
final  bool isSelected;
const  Warehouses({Key? key, this.isSelected = false}) : super(key: key);

  @override
  State<Warehouses> createState() => _WarehousesState();
}
 
class _WarehousesState extends State<Warehouses> {
  String? selectedValue;
  String? selectedData;

  @override
  Widget build(BuildContext context) {
    List<String> warehouseItems = ['Warehouse A', 'Warehouse B', 'Warehouse C'];

    return DropdownButton<String>(
      
      value: selectedValue,
      onChanged: (String? newValue) {
        
        setState(() {
          selectedValue = newValue;
         
          debugPrint("$selectedValue");
        });
      },
      hint:const AppText(color: blackClr,text: "Select your Warehouse",),
      items: warehouseItems.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
// class Warehouse{
//   final String name;
//   Warehouse(this.name);
//   }