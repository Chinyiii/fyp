import 'package:flutter/material.dart';
import 'package:fyp/services/WishlistService.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  String _formatPrice(dynamic price) {
    if (price is String) {
      return price;
    } else if (price is double) {
      return 'RM ${price.toStringAsFixed(2)}';
    } else if (price is int) {
      return 'RM ${price.toDouble().toStringAsFixed(2)}';
    }
    return 'Price not available';
  }

  @override
  Widget build(BuildContext context) {
    final wishlistService = Provider.of<WishlistService>(context);
    final wishlist = wishlistService.wishlist;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: wishlist.isEmpty
          ? const Center(
              child: Text('Your wishlist is empty.'),
            )
          : ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final product = wishlist[index];
                return ListTile(
                  leading: Image.network(product['image']),
                  title: Text(product['name']),
                  subtitle: Text(_formatPrice(product['price'])),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      wishlistService.removeFromWishlist(product);
                    },
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/product-detail', arguments: {'product': product});
                  },
                );
              },
            ),
    );
  }
}
