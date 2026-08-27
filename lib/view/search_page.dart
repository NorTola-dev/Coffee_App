import 'package:coffeeapp/model/coffee_data.dart';
import 'package:coffeeapp/model/coffee_model.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();

  List<CoffeeModel> searchList = coffeeData;
  List<CoffeeModel> result = [];

  @override
  void initState() {
    super.initState();
    result = searchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search your favorite coffee...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
          onChanged: (value) {
            setState(() {
              result = searchList.where((e) => e.name.toLowerCase().contains(value.toLowerCase())).toList();
            });
          },
        ),
      ),
      body: ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          var item = result[index];

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
