import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> _categories = [
    'Running',
    'Basketball',
    'Lifestyle',
    'Skateboarding',
    'Hiking',
    'Tennis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return ListTile(
            title: Text(category),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/category-products', arguments: {'categoryName': category});
            },
          );
        },
      ),
    );
  }
}
