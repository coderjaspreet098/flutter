import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class MyApp2 extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Product 1",
      description: "Description for Product 1",
      price: 19.99,
      imageUrl: "https://cdn.pixabay.com/photo/2014/12/08/14/23/pocket-watch-560937_1280.jpg", // Replace with your image URLs
    ),
    Product(
      name: "Product 2",
      description: "Description for Product 2",
      price: 29.99,
      imageUrl: "https://cdn.pixabay.com/photo/2018/02/24/20/39/clock-3179167_1280.jpg",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Product List"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(

                color: Colors.lightGreenAccent,

                child: Text(
                  "Our Store",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(products[index].imageUrl),
                      radius: 25,
                    ),
                    title: Text(products[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(products[index].description),
                        SizedBox(height: 4),
                        Text(
                          "\$${products[index].price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
