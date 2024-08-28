import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //--------simple list view
        //     child: ListView(
        //   children: List.generate(100, (index) {
        //     return Column(
        //       children: [Text('Item - ${index + 1}'), Divider()],
        //     );
        //   }),
        // )
        //----------------- .seperated provides 3 parameters, 1. to build the content of the list, 2. To buil the seperater, 3. To build the Item Count
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Center(
                  child: Text(
                '${index + 1}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ));
            },
            separatorBuilder: (context, index) {
              // return Divider();// to provide a divider in btwn
              return Center(child: Text('------------'));
            },
            itemCount: 100),
      ),
    );
  }
}
