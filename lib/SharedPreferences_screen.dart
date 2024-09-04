import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//login page
class SharedpreferencesScreen extends StatelessWidget {
  SharedpreferencesScreen({super.key});

  final _inputText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //fn to check if Sharedpreference have value inside
    checkUserName(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              TextFormField(
                controller: _inputText,
                decoration: InputDecoration(
                    labelText: "Ente userName",
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1))),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                    saveUserName();
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }

  //function to store data to the shared_preference screen
  Future<void> saveUserName() async {
    // print(_inputText.text);

    //creating an instance for sharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();

    //storing value to the sharedPreferences storage
    await sharedPreferences.setString('userName', _inputText.text);
  }
}

//function to check if there is any existing value in the sharedPreference storage
Future<void> checkUserName(BuildContext context) async {
  //creating an object of sharedPreference
  final sharedPrfrnce = await SharedPreferences.getInstance();

  final userName = sharedPrfrnce.getString('userName');

  if (userName != null) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AfterLoginPage()));
  }
}

//screen after login
class AfterLoginPage extends StatelessWidget {
  AfterLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(''),
      ),
      body: Container(
        child: Center(child: Text('Successfully logged In')),
      ),
    );
  }
}
