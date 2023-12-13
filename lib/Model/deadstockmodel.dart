// To parse this JSON data, do
//
//     final deadStockResponse = deadStockResponseFromJson(jsonString);

import 'dart:convert';

DeadStockResponse deadStockResponseFromJson(String str) => DeadStockResponse.fromJson(json.decode(str));

String deadStockResponseToJson(DeadStockResponse data) => json.encode(data.toJson());

class DeadStockResponse {
    List<DeadStock> data;
    String message;

    DeadStockResponse({
        required this.data,
        required this.message,
    });

    factory DeadStockResponse.fromJson(Map<String, dynamic> json) => DeadStockResponse(
        data: List<DeadStock>.from(json["data"].map((x) => DeadStock.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class DeadStock {
    String id;
    Warehouse warehouse;
    int v;
    String deadstockId;
    List<ProductElement> product;
    int quantity;

    DeadStock({
        required this.id,
        required this.warehouse,
        required this.v,
        required this.deadstockId,
        required this.product,
        required this.quantity,
    });

    factory DeadStock.fromJson(Map<String, dynamic> json) => DeadStock(
        id: json["_id"],
        warehouse: Warehouse.fromJson(json["warehouse"]),
        v: json["__v"],
        deadstockId: json["deadstock_id"],
        product: List<ProductElement>.from(json["product"].map((x) => ProductElement.fromJson(x))),
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "warehouse": warehouse.toJson(),
        "__v": v,
        "deadstock_id": deadstockId,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
        "quantity": quantity,
    };
}

class ProductElement {
    ProductProduct product;
    int quantity;
    String id;

    ProductElement({
        required this.product,
        required this.quantity,
        required this.id,
    });

    factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductProduct.fromJson(json["product"]),
        quantity: json["quantity"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "quantity": quantity,
        "_id": id,
    };
}

class ProductProduct {
    String id;
    String productid;
    String productname;
    int v;

    ProductProduct({
        required this.id,
        required this.productid,
        required this.productname,
        required this.v,
    });

    factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
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
