import 'package:flutter/material.dart';

//-----------------------scaffold to display the list of names
class ListnavigationScreen extends StatefulWidget {
  const ListnavigationScreen({super.key});

  @override
  State<ListnavigationScreen> createState() => _ListnavigationScreenState();
}

class _ListnavigationScreenState extends State<ListnavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('User List'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('User ${index + 1}'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return UserScreen(
                  UserName: 'User ${index + 1}',
                );
              }));
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 22,
      ),
    );
  }
}

//-----------------------scaffold to display a single name
class UserScreen extends StatelessWidget {
  // const UserScreen({super.key});
  final String UserName;

  const UserScreen({super.key, required this.UserName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('$UserName Page'),
      ),
    );
  }
}
