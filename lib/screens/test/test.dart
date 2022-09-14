import 'package:flutter/material.dart';

import '../../config/route/route_constants.dart';
import '../screens.dart';

class Testing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
        ],
      ),
      body: Navigator(
        onGenerateRoute: (settings) {
          Widget page = PageX();
          if (settings.name == 'page2') page = Page2();
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    );
  }
}

class PageX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1')),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pushNamed(context, 'page2'),
          child: Text('Go to Page2'),
        ),
      ),
    );
  }
}

