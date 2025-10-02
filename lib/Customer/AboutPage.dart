import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            Text(
              'Sneaker Store',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),
            Text(
              'Version 1.0.0',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20),
            Text(
              'This is a sneaker store application built with Flutter. It allows users to browse and purchase sneakers.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
