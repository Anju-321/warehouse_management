import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/api_response.dart';
import '../Urls/url.dart';

enum Method { get, post, put, delete }

class Api {
  static Future<Apiresponse> call(
    BuildContext context, {
    required String endPoint,
    required Method method,
    Object? body,
  }) async {
    try {
      final http.Response response;
      final headers = {'Content-Type': 'application/json', "Authorization": ""};

      //REST API METHOD
      switch (method) {
        case Method.get:
          String url = baseUrl + endPoint;

          response = await http.get(Uri.parse(url), headers: headers);

          debugPrint("${baseUrl + endPoint} ($method)\n$body");
          debugPrint(response.body);
          
          return Apiresponse.fromJson(response.statusCode, response.body);

        case Method.post:
          response = await http.post(Uri.parse(baseUrl + endPoint),
              body: json.encode(body), headers: headers);

          debugPrint("${baseUrl + endPoint} ($method)\n$body");
          debugPrint(response.body);
          return Apiresponse.fromJson(response.statusCode, response.body);

        case Method.put:
          response = await http.put(Uri.parse(baseUrl + endPoint),
              body: json.encode(body), headers: headers);
          debugPrint("${baseUrl + endPoint} ($method)\n$body");
          debugPrint(response.body);
          return Apiresponse.fromJson(response.statusCode, response.body);
        case Method.delete:
          response = await http.delete(Uri.parse(baseUrl + endPoint),
              body: json.encode(body), headers: headers);
          debugPrint("${baseUrl + endPoint} ($method)\n$body");
          debugPrint(response.body);
          return Apiresponse.fromJson(response.statusCode, response.body);

        default:
          return throw "INVALID METHOD";
      }
    } on SocketException {
      debugPrint("${baseUrl + endPoint} ($method)\n$body");

      return Apiresponse.fromJson(
          500, "{message:'Network seems to be offline'}");
    } catch (e) {
      debugPrint(
          "${baseUrl + endPoint} ($method) ${body != null ? '\n$body' : ''}");

      // snackBar(context, message: e.toString());
      debugPrint("$e");
      return Apiresponse.fromJson(500, "{message:'$e'}");
    }
  }
}
