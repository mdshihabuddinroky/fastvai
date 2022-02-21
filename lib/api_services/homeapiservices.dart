import 'package:get/state_manager.dart';
import 'package:http/http.dart'as http;
//import 'package:fastvai/Models/productsModel.dart';
import 'package:fastvai/Models/product.dart';
import 'package:fastvai/Models/categories.dart';




class Productcontroller extends GetxController{
  
var productlist = <Products>[].obs;
var categorylist = <Categories>[].obs;
var isloading=true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
  }
  

   Future<dynamic> fetchProducts()async {
     isloading(true);


     var client =  http.Client();
   var response= await client.get(Uri.parse('https://www.fastvai.com/wp-json/wc/v3/products?consumer_key=ck_684776b52bb78622ee5b59add33aa21181881ae7&consumer_secret=cs_6aa1699cd4574d3567678a8851257e50ddc9d2f1'));
 if(response.statusCode==200){
 
  var productList = productsFromJson(response.body);
  

  if(productList!= null){

   productlist.value =productList;
  }
  fetchCategories();
  }

}


 Future<dynamic> fetchCategories()async {
     isloading(true);


     var client =  http.Client();
   var response= await client.get(Uri.parse('https://fastvai.com/wp-json/wc/v3/products/categories?parent=26&consumer_key=ck_684776b52bb78622ee5b59add33aa21181881ae7&consumer_secret=cs_6aa1699cd4574d3567678a8851257e50ddc9d2f1'));
 if(response.statusCode==200){
 
  var categoryList = categoriesFromJson(response.body);
  

  if(categoryList!= null){

    categorylist.value =categoryList;
  }
  isloading(false);
  }

}
}