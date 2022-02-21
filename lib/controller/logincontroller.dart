import 'dart:convert';

import 'package:fastvai/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Logincontroller extends GetxController {
  var userdata = [].obs;
  var islogin = false.obs;

  checklogin() async {
    final prefs = await SharedPreferences.getInstance();
    var userdetails = prefs.getStringList('userdetails') ?? null;
    userdata(userdetails);
    var isLogin = userdetails == null ? false : true;
    islogin(isLogin);
    print('User data = $userdata');
  }

  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;
  var Userdata = <String, dynamic>{}.obs;

  facebooklogin() async {
    final LoginResult result = await FacebookAuth.instance.login();

    // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      final requestdata =
          await FacebookAuth.i.getUserData(fields: "email,name,picture,id");
      final AccessToken accessToken = result.accessToken!;
      print("Access token: $accessToken");
      // you are logged
      Userdata(requestdata);
      register(
          requestdata['email'].toString(),
          requestdata['id'].toString(),
          requestdata['name'].toString(),
          requestdata["picture"]["data"]["url"].toString());

      islogin(true);
    } else {
      print('error result${result.status}');
      print('error result${result.message}');
    }
  }

  googlelogin() async {
    this.googleAccount = await _googleSignIn.signIn();
    register(
        googleAccount!.email.toString(),
        googleAccount!.id.toString(),
        googleAccount!.displayName.toString(),
        googleAccount!.photoUrl.toString());
  }

  logout() async {
    await FacebookAuth.instance.logOut();
    this.googleAccount = await _googleSignIn.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userdetails');
// or FacebookAuth.i.logOut();
    Userdata(null);
    islogin(false);
  }

  register(String email, String id, String name, String image) async {
    Get.defaultDialog(
        content: Center(
          child: Container(
            color: Colors.white,
            height: 100,
            width: 100,
            child: Column(
              children: const [
                CircularProgressIndicator(
                  color: Colors.black,
                ),
                Text('Loading')
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        radius: 10,
        barrierDismissible: false);
    var client = http.Client();
    Map<String, String> requestheaders = {'Content-Type': 'application/json'};
    var response = await client.post(
        Uri.parse('${Apiconfig.url}${Apiconfig.register}${Apiconfig.tkey}'),

        // await client.post(
        // Uri.https('Apiconfig.url', Apiconfig.register + Apiconfig.tkey),
        headers: requestheaders,
        body: jsonEncode({
          "email": email,
          "first_name": name,
          "username": email,
          "password": id,
        }));
    print('${Apiconfig.url}${Apiconfig.register}${Apiconfig.tkey}');
    print(response.body);

    // var response = await client
    //     .post(Uri.parse(Apiconfig.url + Apiconfig.register + Apiconfig.tkey));
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('userdetails', [id, image, email, name]);

      var testlist = [id, image, email, name];
      userdata(testlist);
      islogin(true);
      Get.back();
      print('test result${response.body}');
    }
  }
}
