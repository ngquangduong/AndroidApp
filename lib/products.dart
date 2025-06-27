import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//API from DummyJSON https://dummyjson.com/products for products
Future<List> fetchProducts() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['products'];
  } else {
    throw 'Lỗi khi tải danh sách sản phẩm';
    }
}

class productsList extends StatefulWidget {
  @override
  State<productsList> createState() => _productsListState();
}

class _productsListState extends State<productsList> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Danh sách sản phẩm'),
      centerTitle: true,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    body: Center(
      child: FutureBuilder<List<dynamic>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data!;
              return GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16.0),
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.8,
                children: List.generate(products.length, (index){
                  final product = products[index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          child: Image.network(
                            product['thumbnail'],
                            height: 120,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.broken_image, size: 120);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40.0,
                                child: Text(
                                    product['title'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '\$${product['price'].toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
          } else if (snapshot.hasError) {
            return Text('Lỗi: ${snapshot.error}');
          } else {
            return Text('Không có sản phẩm nào.');
          }
        },
      ),
    ),
  );
  }
}