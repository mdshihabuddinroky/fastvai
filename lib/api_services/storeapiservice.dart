import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import 'package:fastvai/Models/categories.dart';
import 'package:fastvai/Models/banner_model.dart';
import 'package:fastvai/Models/storemodel.dart';

class Storecontroller extends GetxController {
  var bannerlist = <Banner>[].obs;
  var storelist = <Store>[].obs;
  var unfilterstorelist = <Store>[].obs;
  var isloading = true.obs;
  @override
  void onInit() {}

  Future<dynamic> fetchBanners(List Location) async {
    isloading(true);

    var client = http.Client();
    var response =
        await client.get(Uri.parse('https://fastvai.com/banner.php'));
    if (response.statusCode == 200) {
      var bannerList = bannerFromJson(response.body);

      if (bannerList != null) {
        bannerlist.value = bannerList;
      }
      fetchStores(Location);
    }
  }

  Future<dynamic> fetchStores(location) async {
    isloading(true);

    var client = http.Client();
    var response = await client.get(Uri.parse(
        'https://fastvai.com/store.php?userlat=23.1680784&userlng=92.1970501&distance=10'));
    if (response.statusCode == 200) {
      var storeList = storeFromJson(response.body);

      if (storeList != null) {
        storelist.value = storeList;
        unfilterstorelist.value = storeList;
      }
      isloading(false);
    }
  }
}
