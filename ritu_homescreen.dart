

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/ritu_controller.dart';
import 'package:untitled/ritu_model.dart';
import 'package:flutter/material.dart';


class GetApi {
  Future<List<CartModel>> fetchUsersData() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/carts'));
    if (response.statusCode == 200) {
      // Use the generated fromJson constructor
      return List<CartModel>.from(json.decode(response.body).map((x) => CartModel.fromJson(x)));
    } else {
      throw Exception('Network problem');
    }
  }
}

class CartListView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart data'),
      ),
      body: GetBuilder<CartController>(
       // init: cartController, // Initialize with your controller
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: controller.cartList.length,
            itemBuilder: (context, index) {
              final cartModel = controller.cartList[index];
              return ListTile(
                title: Text('Cart ID: ${cartModel.carts![index].id}'), // Customize this as per your model
                // Add more elements as needed from your model
              );
            },
          );
        },
      ),
    );
  }
}

