import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ware_house_management/Model/user_model.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:ware_house_management/Services/api.dart';
import 'package:ware_house_management/Urls/url.dart';

part 'login_state.dart';

String? loginuserId;


class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(LoginInitial());

  final BuildContext context;

  loginapi(String username, String password) async {
    var response = await Api.call(context,
        endPoint: loginUrl,
        method: Method.post,
        body: UserModel(username, password));

    if (response.status) {
      // Decode the token
      Map<String, dynamic> decodedToken = Jwt.parseJwt(response.token);

      // Extract loginuserId and username
      loginuserId = decodedToken['userId'];

          // Save loginuserId in shared preferences
      await saveUserIdToSharedPreferences(loginuserId);
     

      debugPrint(" userid: $loginuserId ");
    
      Navigator.pushNamed(context, "homepage");

      debugPrint(response.message.toString());
    } else {
      debugPrint(response.message.toString());
    }
  }
  // Function to save loginuserId in shared preferences
  Future<void> saveUserIdToSharedPreferences(String? userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('loginUserId', userId ?? '');
  }
}
