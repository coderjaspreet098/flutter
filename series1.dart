import 'package:flutter/material.dart';

void main() {
  runApp(ProductListApp());
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isSelected;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isSelected = false,
  });
}

class ProductListApp extends StatefulWidget {
  @override
  _ProductListAppState createState() => _ProductListAppState();
}

class _ProductListAppState extends State<ProductListApp> {
  final List<Product> products = [
    Product(
      name: "Product 1",
      description: "Description for Product 1",
      price: 19.99,
      imageUrl: "https://cdn.pixabay.com/photo/2014/12/08/14/23/pocket-watch-560937_1280.jpg",
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
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: products[index].isSelected,
                    onChanged: (value) {
                      setState(() {
                        products[index].isSelected = value!;
                      });
                    },
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
                    secondary: CircleAvatar(
                      backgroundImage: NetworkImage(products[index].imageUrl),
                      radius: 25,
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
