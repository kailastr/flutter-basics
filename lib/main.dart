// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic/ListNavigation_screen.dart';
import 'package:flutter_basic/SharedPreferences_screen.dart';
import 'package:flutter_basic/Testing/Rest_GET_screen.dart';
import 'package:flutter_basic/Whatsapp_Screen.dart';
import 'package:flutter_basic/list_screen.dart';

//importing scaffold widget from another file
import 'package:flutter_basic/screen_New.dart';
import 'package:shared_preferences/shared_preferences.dart';

//variable for shared_preferences instance
late SharedPreferences sharedPreferences;

Future<void> main() async {
  // sharedPreferences = await SharedPreferences.getInstance();
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
      home: IndexPage(),
      routes: {
        'ExpandedContainer_screen': (context) {
          return ExpandedWidget();
        },
        'Btn_screen': (context) {
          return ColumnScreen();
        },
        'Input_screen': (context) {
          return InputScreen();
        },
        'Whatsapp_screen': (context) {
          return WhatsappScreen();
        },
        'List_screen': (context) {
          return ListScreen();
        },
        'StateCount_screen': (context) {
          return NewScreen();
        },
        'Testing_Screen': (context) {
          return ListnavigationScreen();
        },
        'sharedPreferences_screen': (context) {
          return SharedpreferencesScreen();
        },
        'rest_get': (context) {
          return RestGetScreen();
        }
      },
    );
  }
}

//Navigation purpose
class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            //to pop from the entire app
            SystemNavigator.pop();
          },
        ),
        title: Text('Index Page'),
      ),
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        margin: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            // basic widgets
            Center(
              child: Text(
                'Basic Widgets',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[900]),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.amber[100],
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5)),
                //used instead of row to avoid overflow
                child: Wrap(
                  spacing: 8, //horizontal spacing
                  runSpacing: 8, //vertical spacing
                  children: [
                    ElevatedButton(
                        //one method of navigating
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
                        },
                        child: Text('Text')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('ExpandedContainer_screen');
                        },
                        child: Text('Expanded')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('Btn_screen');
                        },
                        child: Text('Buttons')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('Input_screen');
                        },
                        child: Text('Input'))
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            //Basic scaffolds
            Center(
              child: Text(
                'Basic Scaffolds',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue[100]),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('Whatsapp_screen');
                        },
                        child: Text('Whatsapp')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('List_screen');
                        },
                        child: Text('List')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('StateCount_screen');
                        },
                        child: Text('State')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed("sharedPreferences_screen");
                        },
                        child: Text('Shared Preferences'))
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            //Learning section
            Center(
              child: Text(
                'Learning',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.deepPurple[300]),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.black)),
                        onPressed: () {
                          Navigator.of(context).pushNamed('Testing_Screen');
                        },
                        child: Text(
                          'Under Dev',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            //Testing section
            Center(
              child: Text(
                'REST APIs ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800]),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white)),
                        onPressed: () {
                          Navigator.of(context).pushNamed('rest_get');
                        },
                        child: Text(
                          'GET',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
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
