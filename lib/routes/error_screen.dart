import "package:flutter/material.dart";

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page not found"),
      ),
      body: Center(
        child: Image.network(
            "https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif",
            height: double.infinity * 0.8,
            width: double.infinity,
            fit: BoxFit.cover),
      ),
    );
  }
}
