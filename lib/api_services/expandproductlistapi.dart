import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
//import 'package:fastvai/Models/productsModel.dart';
import 'package:fastvai/Models/product.dart';
import 'package:fastvai/config.dart';

class ExpnadProductcontroller extends GetxController {
  var productlist = <Products>[].obs;
  var page = 1.obs;
  var isloading = true.obs;

// @override
// void oninit() {
//   fetchProducts(" dvds");
//   super.onInit();

// }
  Future<dynamic> fetchProducts(String querry) async {
    isloading(true);

    var client = http.Client();

    var response = await client.get(Uri.parse(
        Apiconfig.url + Apiconfig.categories + querry + Apiconfig.key));
    if (response.statusCode == 200) {
      var productList = productsFromJson(response.body);

      if (productList != null) {
        productlist.clear();
        productlist.value = productList;
      }

      isloading(false);
    }
  }
}
