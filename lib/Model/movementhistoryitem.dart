// To parse this JSON data, do
//
//     final movementHistoryData = movementHistoryDataFromJson(jsonString);

import 'dart:convert';

List<MovementHistoryData> movementHistoryDataFromJson(String str) => List<MovementHistoryData>.from(json.decode(str).map((x) => MovementHistoryData.fromJson(x)));

String movementHistoryDataToJson(List<MovementHistoryData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovementHistoryData {
    String id;
    String movementId;
    List<Product> products;
    Warehouse sourceWarehouse;
    Warehouse destinationWarehouse;
    String movementType;
    UserId userId;
    DateTime timestamp;
    int v;

    MovementHistoryData({
        required this.id,
        required this.movementId,
        required this.products,
        required this.sourceWarehouse,
        required this.destinationWarehouse,
        required this.movementType,
        required this.userId,
        required this.timestamp,
        required this.v,
    });

    factory MovementHistoryData.fromJson(Map<String, dynamic> json) => MovementHistoryData(
        id: json["_id"],
        movementId: json["movement_id"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        sourceWarehouse: Warehouse.fromJson(json["sourceWarehouse"]),
        destinationWarehouse: Warehouse.fromJson(json["destinationWarehouse"]),
        movementType: json["movementType"],
        userId: UserId.fromJson(json["userId"]),
        timestamp: DateTime.parse(json["timestamp"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "movement_id": movementId,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "sourceWarehouse": sourceWarehouse.toJson(),
        "destinationWarehouse": destinationWarehouse.toJson(),
        "movementType": movementType,
        "userId": userId.toJson(),
        "timestamp": timestamp.toIso8601String(),
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

class Product {
    dynamic product;
    int quantity;
    String id;

    Product({
        required this.product,
        required this.quantity,
        required this.id,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        product: json["product"],
        quantity: json["quantity"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
        "_id": id,
    };
}

class UserId {
    String id;
    String userId;
    String username;
    String password;
    String role;
    bool isActive;
    int v;

    UserId({
        required this.id,
        required this.userId,
        required this.username,
        required this.password,
        required this.role,
        required this.isActive,
        required this.v,
    });

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        userId: json["userId"],
        username: json["username"],
        password: json["password"],
        role: json["role"],
        isActive: json["isActive"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "username": username,
        "password": password,
        "role": role,
        "isActive": isActive,
        "__v": v,
    };
}
