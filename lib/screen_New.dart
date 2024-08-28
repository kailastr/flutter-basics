//screen with a add floating Action button which increments the value of a count
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count = count + 1;
          });
        },
        child: Icon(Icons.add),
      ),
      body: Center(
          child: //Text(count.toString()), //--instead of directly calling a Text filed we can also pass the count to another stateless widget just to display that no.
              DisplayCount(DisplayText: count.toString())),
    );
  }
}

class DisplayCount extends StatelessWidget {
  final String DisplayText;

  //created a constructor to get value to the 'DisplayText' variable by clicking on the 'DisplayText' variable -> create constructor
  const DisplayCount({required this.DisplayText});

  @override
  Widget build(BuildContext context) {
    return Text(DisplayText,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
  }
}
