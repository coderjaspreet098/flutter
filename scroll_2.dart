import 'package:flutter/material.dart';
void main(){
  runApp(pageslist());
}


class Product {
  final String name;
  final String description;
  final double price;

  Product(this.name, this.description, this.price);
}

class pageslist extends StatelessWidget {
  final List<Product> products = [
    Product('Product 1', 'Description for Product 1', 19.99),
    Product('Product 2', 'Description for Product 2', 29.99),
    Product('Product 3', 'Description for Product 3', 39.99),
    Product('Product 4', 'Description for Product 4', 49.99),
    Product('Product 5', 'Description for Product 5', 59.99),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(products[index].name),
              subtitle: Text(products[index].description),
              trailing: Text('\$${products[index].price.toStringAsFixed(2)}'),
            );
          },
        ),
      ),
    );
  }
}
