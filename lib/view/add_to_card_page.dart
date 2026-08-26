import 'package:coffeeapp/model/add_to_cart_model.dart';
import 'package:flutter/material.dart';

class AddToCardPage extends StatefulWidget {
  const AddToCardPage({super.key});

  @override
  State<AddToCardPage> createState() => _AddToCardPageState();
}

class _AddToCardPageState extends State<AddToCardPage> {
  @override
  Widget build(BuildContext context) {
    
    double sum = 0;

    for (var e in newList) {
      print(e.qty);
      print(e.price);
      sum += e.price * e.qty;
      print(sum);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub Total : ',
                              style: TextStyle(fontSize: 25),
                            ),
                            Text('\$ $sum', style: TextStyle(fontSize: 25)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              'Delivery Fee : ',
                              style: TextStyle(fontSize: 25),
                            ),
                            Text('\$ 0', style: TextStyle(fontSize: 25)),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text('Total : ', style: TextStyle(fontSize: 25)),
                            Text('\$ $sum', style: TextStyle(fontSize: 25)),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text('Check Out'),
                              Icon(Icons.shopping_cart_checkout),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.attach_money_rounded),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: newList.length,
        itemBuilder: (context, index) {
          var item = newList[index];

          if (newList.isEmpty) {
            return Center(child: Text('No Data'));
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 140,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    item.image,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error_outline),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name),
                      Row(
                        children: [
                          Text('\$ ${item.price}'),
                          SizedBox(width: 130),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    item.qty++;
                                  });
                                },
                                icon: Icon(Icons.add),
                              ),
                              Text('${item.qty}'),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    item.qty--;
                                  });
                                },
                                icon: Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
