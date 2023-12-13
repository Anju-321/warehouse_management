// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ware_house_management/Model/stocksdata.dart';
// import 'package:ware_house_management/pages/stocks/cubit/stocks_cubit.dart';

// class StocksPage extends StatelessWidget {
//   const StocksPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Warehouse Stocks'),
//       ),
//       body: BlocProvider(
//         create: (context) => StocksCubit(context),
//         child: BlocBuilder<StocksCubit, StocksState>(
//           builder: (context, state) {
//             if (state is StocksInitial) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is StocksDataLoaded) {
//               return ListView.builder(
//                 itemCount: state.stocks.length,
//                 itemBuilder: (context, index) {
//                   Stock stock = state.stocks[index];
//                   return ListTile(
//                     title: Text(stock.warehouse),
//                     subtitle: Text('Total Stocks: ${stock.totalStock}'),
//                   );
//                 },
//               );
//             } else if (state is StocksError) {
//               return Center(child: Text('Error: ${state.error}'));
//             } else {
//               return const Center(child: Text('Unknown State'));
//             }
//           },
//         )
//       )
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ware_house_management/Model/stocksdata.dart';
import 'package:ware_house_management/components/app_bar.dart';
import 'package:ware_house_management/components/bottomnav.dart';
import 'package:ware_house_management/pages/stocks/cubit/stocks_cubit.dart';

class StocksPage extends StatelessWidget {
  const StocksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize:
            Size.fromHeight(100.0), // Set the preferred height of the app bar
        child: CustomAppBar(
          text: 'Warehouse Stocks',
          color: Colors.white,
          
        ),
      ),
      body: BlocProvider(
        create: (context) => StocksCubit(context),
        child: BlocBuilder<StocksCubit, StocksState>(
          builder: (context, state) {
            if (state is StocksInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is StocksDataLoaded) {
              return ListView.builder(
                itemCount: state.stocks.length,
                itemBuilder: (context, index) {
                  Stock stock = state.stocks[index];
                  return Card(
                    elevation: 3.0,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ListTile(
                      leading: const Icon(Icons.business, size: 40.0, color: Colors.blue),
                      title: Text(
                        stock.warehouse,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      subtitle: Text('Total Stocks: ${stock.totalStock}', style: const TextStyle(fontSize: 16.0)),
                      // trailing: const Icon(Icons.arrow_forward_ios),
                      // onTap: () {
                      //   // Handle tile tap if needed
                      // },
                    ),
                  );
                },
              );
            } else if (state is StocksError) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return const Center(child: Text('Unknown State'));
            }
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigations(),
    );
  }
}
