import 'package:coffeeapp/model/add_to_cart_model.dart';
import 'package:coffeeapp/model/coffee_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  CoffeeModel model;

  DetailPage({super.key, required this.model});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int qty = 0;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.model.image),
            Row(
              children: [
                Text(widget.model.name),
                Text(widget.model.price.toString()),
              ],
            ),
            Text(widget.model.des),
            Text('Select Size'),
            SizedBox(
              width: 200,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.model.size.length,
                itemBuilder: (context, index) {
                  var data = widget.model.size[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 4, color: Colors.brown),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          data == "S"
                              ? Icon(
                                  Icons.coffee_outlined,
                                  color: Colors.brown.shade500,
                                )
                              : data == "M"
                              ? Icon(
                                  Icons.coffee_maker,
                                  color: Colors.brown.shade500,
                                )
                              : Icon(
                                  Icons.coffee,
                                  color: Colors.brown.shade500,
                                ),
                          Text('${data} OZ'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                qty++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                          Text('$qty'),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                qty--;
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        newList.add(
                          AddToCartModel(
                            name: widget.model.name,
                            image: widget.model.image,
                            price: widget.model.price,
                            qty: qty,
                          ),
                        );
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(child: Text('Add to Card Success'));
                          },
                        );
                      },
                      label: Icon(Icons.shopping_cart),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
