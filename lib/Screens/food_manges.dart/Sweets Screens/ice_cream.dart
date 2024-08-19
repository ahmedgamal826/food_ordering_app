import 'package:flutter/material.dart';
import 'package:food_ordering_app/Screens/food_manges.dart/add_food_page.dart';
import 'package:food_ordering_app/Screens/food_manges.dart/food_list.dart';
import 'package:food_ordering_app/widgets/search_textform_field.dart';

class IceCream extends StatefulWidget {
  const IceCream({super.key});

  @override
  State<IceCream> createState() => _IceCreamState();
}

class _IceCreamState extends State<IceCream> {
  String searchQuery = '';

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange,
        title: const Text(
          'Ice Cream',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchTextformField(
              hintText: 'Search your ice cream...',
              onChanged: updateSearchQuery, // Pass the function here
            ),
          ),
          Expanded(
            child: FoodList(
              collectionName: 'ice cream category',
              searchQuery: searchQuery, // Pass the searchQuery here
              foodName: 'ice cream',
              foodDetailsRoute: 'iceCream',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: const Icon(
            Icons.add,
            size: 33,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddFoodPage(
                  collectionName: 'ice cream category',
                  categoryName: 'Sweets',
                ),
              ),
            );
          }),
    );
  }
}
