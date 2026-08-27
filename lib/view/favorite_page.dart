import 'package:coffeeapp/model/coffee_data.dart';
import 'package:coffeeapp/model/coffee_model.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<CoffeeModel> favItem = coffeeData
      .where((e) => e.favorite == true)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite Page')),
      body: ListView.builder(
        itemCount: favItem.length,
        itemBuilder: (context, index) {
          var item = favItem[index];

          if (favItem.isEmpty) {
            return Text('No Data');
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
                      Row(
                        children: [
                          Text(item.name),
                          SizedBox(width: 100),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                item.favorite = !item.favorite;
                                if (item.favorite == false) {
                                  favItem.removeAt(index);
                                }
                              });
                            },
                            icon: item.favorite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  )
                                : Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('\$ ${item.price}'),
                          SizedBox(width: 130),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_circle, size: 40),
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
