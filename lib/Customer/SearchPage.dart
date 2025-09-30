import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];
  final List<Map<String, dynamic>> _allProducts = [
    {'name': 'Nike Air Max 90', 'price': 120.00, 'image': 'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=70&h=93&fit=crop'},
    {'name': 'Adidas Ultraboost', 'price': 180.00, 'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=70&h=93&fit=crop'},
    {'name': 'Puma Suede Classic', 'price': 65.00, 'image': 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=70&h=93&fit=crop'},
    {'name': 'Reebok Club C 85', 'price': 75.00, 'image': 'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=70&h=93&fit=crop'},
    {'name': 'Vans Old Skool', 'price': 60.00, 'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=70&h=93&fit=crop'},
    {'name': 'Converse Chuck Taylor', 'price': 55.00, 'image': 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=70&h=93&fit=crop'},
  ];

  @override
  void initState() {
    super.initState();
    _searchResults = _allProducts;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_searchController.text.isEmpty) {
      setState(() {
        _searchResults = _allProducts;
      });
    } else {
      setState(() {
        _searchResults = _allProducts
            .where((product) => product['name']
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search for products...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final product = _searchResults[index];
          return ListTile(
            leading: Image.network(product['image']),
            title: Text(product['name']),
            subtitle: Text('\$${product['price'].toStringAsFixed(2)}'),
            onTap: () {
              Navigator.pushNamed(context, '/product-detail', arguments: {'product': product});
            },
          );
        },
      ),
    );
  }
}
