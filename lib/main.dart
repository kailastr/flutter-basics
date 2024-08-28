// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/Whatsapp_Screen.dart';
import 'package:flutter_basic/list_screen.dart';

//importing scaffold widget from another file
import 'package:flutter_basic/screen_New.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.green), //theme data
        // home: HomeScreen(), //calling HomeScreen class as home
        // home: NewScreen());
        home: WhatsappScreen());
  }
}

//Navigation purpose
class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        margin: const EdgeInsets.only(top: 20),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Container',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Expanded',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Input Field',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      )),
    );
  }
}

//Basic Text - scaffold (screen)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: const SafeArea(
          //since this safe Area section is static and doesnt change, we can make it constant
          child: Align(
        // alignment: Alignment(x, y)
        alignment: Alignment(0, -1),
        child: Text(
          'Hello world,',
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 30,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic),
        ),
      )),
    );
  }
}

//Coulumn and Row based scaffold with 3 diff buttons
class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 255, 162, 133),
        appBar: AppBar(backgroundColor: Colors.amber[800]),
        body: Container(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Hello User',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 30),
                ),
                TextButton(
                    onPressed: () {
                      print('Text btn clicked');
                    },
                    child: const Text('Text button')),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Elevated button")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('This is a Icons btn ->'),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.mic))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

//Expanded widget
class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 42, 254, 67),
                    border: Border.all(
                      color: Colors.red,
                      width: 20,
                    ),
                    borderRadius: BorderRadius.circular(300)),
                width: double.infinity,
                // color: Colors.amber,
                child: const Center(
                    child: Text(
                  'Container 1 with flex 2',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              )),
          Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Container 2 with flex 4',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          Expanded(
              child: Container(
            width: double.infinity,
            color: Colors.brown,
            child: const Center(
              child: Text(
                'Cotainer 3 with default flex (1)',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ))
        ],
      )),
    );
  }
}

//Input Field Widget
class InputScreen extends StatefulWidget {
  InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _textController = TextEditingController();

  String InputText = "Input Text Shown here";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(200)),
                hintText: "Enter something",
                contentPadding: EdgeInsets.only(left: 20, right: 20),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print(_textController.text);
                  setState(() {
                    InputText = _textController.text;
                  });
                },
                child: Text('Submit')),
            Text(InputText),
          ],
        ),
      )),
    );
  }
}
