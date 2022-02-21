import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class Facebooklogin extends GetxController {
  var Userdata = <String, dynamic>{}.obs;
  login() async {
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      // you are logged
      final requestdata =
          await FacebookAuth.i.getUserData(fields: "email,name,picture,id");
      print(requestdata);
      Userdata(requestdata);
    } else {
      print(result.status);
      print(result.message);
    }
  }

  logout() async {
    await FacebookAuth.instance.logOut();
    Userdata();
  }
}
//wp id :54
//fb id: 3178378889154620