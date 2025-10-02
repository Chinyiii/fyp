import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Frequently Asked Questions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            _buildFaqItem('How do I return an item?', 'You can return an item within 7 days of purchase. Please go to your order history and select the item you want to return.'),
            _buildFaqItem('What are the payment methods available?', 'We accept credit/debit cards and online banking.'),
            _buildFaqItem('How do I track my order?', 'You can track your order in the "My Orders" section.'),
            SizedBox(height: 32),
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('support@sneakerstore.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+60 12-345 6789'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return ExpansionTile(
      title: Text(question),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
