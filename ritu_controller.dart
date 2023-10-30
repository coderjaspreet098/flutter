import 'package:get/get.dart';
import 'ritu_model.dart';
import 'package:untitled/ritu_homescreen.dart';
class CartController extends GetxController{
  var isLoading = true.obs;
  var cartList = <CartModel>[].obs;

  getCart() async{
    try{
      isLoading(true);
      var cartData = GetApi().fetchUsersData();
      cartList.addAll(cartData as Iterable<CartModel>);
    }
    catch(e){
      print('error$e');
    }
    finally{
      isLoading(false);
    }
  }
}