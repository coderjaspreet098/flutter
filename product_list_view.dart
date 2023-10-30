import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              final productModel = controller.data[index];

              if (productModel.products != null && productModel.products!.isNotEmpty) {
                final product = productModel.products![0];

                return ListTile(
                  title: Text('Product Name: ${product.title}'),
                  subtitle: Text('Product Description: ${product.description}'),

                );
              } else {

                return ListTile(
                  title: Text('No Products Found'),
                );
              }
            },
          );
        },
      ),
    );
  }
}
