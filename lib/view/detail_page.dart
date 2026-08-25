import 'package:coffeeapp/model/coffee_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  CoffeeModel model;

  DetailPage({super.key, required this.model});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: widget.model.favorite
                ? Icon(Icons.favorite, color: Colors.red, size: 30)
                : Icon(Icons.favorite_border, size: 25),
          ),
        ],
      ),
      body: Column(children: [Image.network(widget.model.image)]),
    );
  }
}
