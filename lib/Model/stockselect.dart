// import 'dart:convert';

// import 'package:flutter/material.dart';

// StockselectModel stockModelFromJson(String str) => StockselectModel.fromJson(json.decode(str));

// String stockModelToJson(StockselectModel data) => json.encode(data.toJson());

// class StockselectModel {
//     String message;
//     Data data;

//     StockselectModel({
//         required this.message,
//         required this.data,
//     });

//     factory StockselectModel.fromJson(Map<String, dynamic> json) => StockselectModel(
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "message": message,
//         "data": data.toJson(),
//     };
// }

// class Data {
//     List<StockEntry> stockEntries;
//     int totalStock;

//     Data({
//         required this.stockEntries,
//         required this.totalStock,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//     stockEntries: List<StockEntry>.from(json["stockEntries"].map((x) => StockEntry.fromJson(x))),
//         totalStock: json["totalStock"],

//     );

//     Map<String, dynamic> toJson() => {
//         "stockEntries": List<dynamic>.from(stockEntries.map((x) => x.toJson())),
//         "totalStock": totalStock,

//     };
// }

// class StockEntry {
//     String id;
//     Warehouse warehouse;
//     Product product;
//     int v;
//     int stock;
//     bool isSelected;
//     TextEditingController? txtCtrl;

//     StockEntry({
//         required this.id,
//         required this.warehouse,
//         required this.product,
//         required this.v,
//         required this.stock,
//         required this.isSelected,
//           this.txtCtrl,
//     });

//     factory StockEntry.fromJson(Map<String, dynamic> json) => StockEntry(
//         id: json["_id"],
//         warehouse: Warehouse.fromJson(json["warehouse"]),
//         product: Product.fromJson(json["product"]),
//         v: json["__v"],
//         stock: json["stock"], isSelected: false,
//         txtCtrl : TextEditingController()
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "warehouse": warehouse.toJson(),
//         "product": product.toJson(),
//         "__v": v,
//         "stock": stock,
//     };
// }

// class Product {
//     String id;
//     String productid;
//     String productname;
//     int v;

//     Product({
//         required this.id,
//         required this.productid,
//         required this.productname,
//         required this.v,

//     });

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["_id"],
//         productid: json["productid"],
//         productname: json["productname"],
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "productid": productid,
//         "productname": productname,
//         "__v": v,
//     };
// }

// class Warehouse {
//     String id;
//     String warehouseId;
//     String warehousename;
//     bool isActive;
//     int v;

//     Warehouse({
//         required this.id,
//         required this.warehouseId,
//         required this.warehousename,
//         required this.isActive,
//         required this.v,
//     });

//     factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
//         id: json["_id"],
//         warehouseId: json["warehouseId"],
//         warehousename: json["warehousename"],
//         isActive: json["isActive"],
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "warehouseId": warehouseId,
//         "warehousename": warehousename,
//         "isActive": isActive,
//         "__v": v,
//     };
// }
// To parse this JSON data, do
//
//     final stockselectModel = stockselectModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

StockselectModel stockselectModelFromJson(String str) =>
    StockselectModel.fromJson(json.decode(str));

String stockselectModelToJson(StockselectModel data) =>
    json.encode(data.toJson());

class StockselectModel {
  String message;
  Data data;

  StockselectModel({
    required this.message,
    required this.data,
  });

  factory StockselectModel.fromJson(Map<String, dynamic> json) =>
      StockselectModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  List<StockEntry> stockEntries;
  int totalStock;

  Data({
    required this.stockEntries,
    required this.totalStock,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        stockEntries: List<StockEntry>.from(
            json["stockEntries"].map((x) => StockEntry.fromJson(x))),
        totalStock: json["totalStock"],
      );

  Map<String, dynamic> toJson() => {
        "stockEntries": List<dynamic>.from(stockEntries.map((x) => x.toJson())),
        "totalStock": totalStock,
      };
}

class StockEntry {
  String id;
  Product? product;
  Warehouse warehouse;
  int v;
  int stock;
  bool isSelected;
  TextEditingController? txtCtrl;
  StockEntry({
    required this.id,
    required this.product,
    required this.warehouse,
    required this.v,
    required this.stock,
    required this.isSelected,
    this.txtCtrl
  });

  factory StockEntry.fromJson(Map<String, dynamic> json) => StockEntry(
        id: json["_id"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        warehouse: Warehouse.fromJson(json["warehouse"]),
        v: json["__v"],
        stock: json["stock"], isSelected: false,
        txtCtrl: TextEditingController()
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product": product?.toJson(),
        "warehouse": warehouse.toJson(),
        "__v": v,
        "stock": stock,
      };
}

class Product {
  String id;
  String productid;
  String productname;
  int v;

  Product({
    required this.id,
    required this.productid,
    required this.productname,
    required this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        productid: json["productid"],
        productname: json["productname"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "productid": productid,
        "productname": productname,
        "__v": v,
      };
}

class Warehouse {
  String id;
  String warehouseId;
  String warehousename;
  bool isActive;
  int v;

  Warehouse({
    required this.id,
    required this.warehouseId,
    required this.warehousename,
    required this.isActive,
    required this.v,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
        id: json["_id"],
        warehouseId: json["warehouseId"],
        warehousename: json["warehousename"],
        isActive: json["isActive"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "warehouseId": warehouseId,
        "warehousename": warehousename,
        "isActive": isActive,
        "__v": v,
      };
}
