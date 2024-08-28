import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: List.generate(100, (index) {
          return Column(
            children: [Text('Item - ${index}'), Divider()],
          );
        }),
      )),
    );
  }
}
