import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ware_house_management/components/app_button.dart';
import 'package:ware_house_management/components/app_text.dart';

import 'package:ware_house_management/components/color.dart';
import 'package:ware_house_management/pages/Login/cubit/login_cubit.dart';
import 'package:ware_house_management/pages/Movement_flow/select-product/cubit/selectproduct_cubit.dart';



class ProductselectPage extends StatelessWidget {
  ProductselectPage({super.key});  
  bool isChecked = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductselectPage"),
      ),
      body: BlocProvider(
        create: (context) => SelectproductCubit(context,loginUserId: loginuserId),
        child: BlocBuilder<SelectproductCubit, SelectproductState>(
          builder: (context, state) {
            final cubit = context.read<SelectproductCubit>();

 
              
            if (state is StockData && state.data != null) {
              if (state.data!.isEmpty) {
                const Text("No Data");
              }
              return Stack(
                children: [
                  ListView.separated(
                      itemBuilder: (context, index) {
                        final stocks = state.data![index];

                        return ListTile(
                          trailing: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: blackClr),
                                borderRadius: BorderRadius.circular(16)),
                            width: 46,
                            height: 46,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: stocks.txtCtrl,
                              onChanged: (value) {
                               
                              },
                            ),
                          ),
                          title: AppText(
                            text: stocks.product?.productname ?? "null",
                            color: Colors.black,
                          ),
                          subtitle: AppText(
                              text: stocks.stock.toString(),
                              color: Colors.black),
                              ////checkbox
                          leading: Checkbox(value: stocks.isSelected,
                          onChanged: (value) {
                            
                            cubit.checkboxSelect(stocks);
                            
                          },), 
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.data?.length ?? 0),
                  Positioned(
                    bottom: 30,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                      // cubit.submitApi();
                      cubit.submitData();
                      },
                      child: const AppButton(
                          text: "Submit",
                          bgcolor: blackClr,
                          size: 16,
                          txtClr: whiteClr,
                          height: 50,
                          width: 150),
                    ),
                  )
                ],
              );
            } else {
              return const Center(child: CupertinoActivityIndicator());
            }
          },
        ),
      ),
    );
  }
  }