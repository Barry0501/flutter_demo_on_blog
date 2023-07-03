import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('DetailPage build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPage'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Typing text here....',
            ),
          ),
        ),
      ),
    );
  }
}
