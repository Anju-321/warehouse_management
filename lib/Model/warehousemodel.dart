import 'dart:convert';

WarehousModel warehousModelFromJson(String str) => WarehousModel.fromJson(json.decode(str));

String warehousModelToJson(WarehousModel data) => json.encode(data.toJson());

class WarehousModel {
    List<Datum> data;
    String message;

    WarehousModel({
        required this.data,
        required this.message,
    });

    factory WarehousModel.fromJson(Map<String, dynamic> json) => WarehousModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    String id;
    // String warehouseId;
    String warehousename;
    // bool isActive;
    // int v;

    Datum({
        required this.id,
        // required this.warehouseId,
        required this.warehousename,
        // required this.isActive,
        // required this.v,
       
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        // warehouseId: json["warehouseId"],
        warehousename: json["warehousename"],
        // isActive: json["isActive"],
        // v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        // "warehouseId": warehouseId,
        "warehousename": warehousename,
        // "isActive": isActive,
        // "__v": v,
    };
}