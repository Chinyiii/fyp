import 'package:flutter/material.dart';

class BrandsPage extends StatelessWidget {
  final List<Map<String, String>> _brands = [
    {'name': 'Nike', 'logo': 'https://example.com/nike_logo.png'},
    {'name': 'Adidas', 'logo': 'https://example.com/adidas_logo.png'},
    {'name': 'Puma', 'logo': 'https://example.com/puma_logo.png'},
    {'name': 'Reebok', 'logo': 'https://example.com/reebok_logo.png'},
    {'name': 'New Balance', 'logo': 'https://example.com/new_balance_logo.png'},
    {'name': 'Vans', 'logo': 'https://example.com/vans_logo.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1.5,
        ),
        itemCount: _brands.length,
        itemBuilder: (context, index) {
          final brand = _brands[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/brand-products', arguments: {'brandName': brand['name']});
            },
            child: Card(
              elevation: 2.0,
              child: Center(
                child: Text(
                  brand['name']!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
