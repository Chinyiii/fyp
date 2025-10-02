import 'package:flutter/material.dart';

class BrandProductsPage extends StatelessWidget {
  final String brandName;

  const BrandProductsPage({super.key, required this.brandName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brandName),
      ),
      body: Center(
        child: Text('Products for $brandName'),
      ),
    );
  }
}
