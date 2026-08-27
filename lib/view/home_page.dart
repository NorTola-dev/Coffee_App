import 'package:coffeeapp/model/coffee_data.dart';
import 'package:coffeeapp/model/coffee_model.dart';
import 'package:coffeeapp/view/add_to_card_page.dart';
import 'package:coffeeapp/view/detail_page.dart';
import 'package:coffeeapp/view/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = coffeeData.map((e) => e.category).toSet().toList();
  List<CoffeeModel> hotCoffee = coffeeData
      .where((e) => e.category == "Hot Coffee")
      .toList();
  List<CoffeeModel> coldCoffee = coffeeData
      .where((e) => e.category == "Cold Coffee")
      .toList();
  List<CoffeeModel> hotDrink = coffeeData
      .where((e) => e.category == "Hot Drink")
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.coffee, color: Colors.brown),
        title: Text(
          'Coffee Shop',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddToCardPage()),
              );
            },
            icon: Icon(Icons.shopping_bag, color: Colors.brown),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning, Coffee\nLover!',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 15),

            Text(
              'Ready for your morning ritual?',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.normal),
            ),

            SizedBox(height: 15),

            TextField(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search your favorite coffee...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            SizedBox(height: 15),

            Expanded(
              child: DefaultTabController(
                length: categories.length,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TabBar(
                        indicatorColor: Colors.brown,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.brown.shade400,
                        ),
                        labelColor: Colors.white,
                        tabs: List.generate(categories.length, (index) {
                          return Tab(text: categories[index]);
                        }),
                      ),
                    ),

                    Expanded(
                      child: TabBarView(
                        children: List.generate(categories.length, (index) {
                          if (categories[index] == "Hot Coffee") {
                            return categoryItem(hotCoffee);
                          } else if (categories[index] == "Cold Coffee") {
                            return categoryItem(coldCoffee);
                          } else {
                            return categoryItem(hotDrink);
                          }
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryItem(List<CoffeeModel> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        var item = data[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(model: item),
                ),
              );
            },
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
          ),
        );
      },
    );
  }
}
