import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WhatsappScreen extends StatelessWidget {
  const WhatsappScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          'Whatsapp Demo',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.green[100],
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: ClipOval(
                  child: Image.asset(
                    'assets/images/oldMan.png',
                    width: 60, // double the radius
                    height: 60,
                    fit: BoxFit
                        .cover, // Ensures the image covers the entire circle
                  ),
                ),
                //--------------------------------to get image from the internet
                // backgroundImage: NetworkImage(
                //     'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671142.jpg')),
                title: Text('${index + 1} Title UserName'),
                subtitle: Text('$index Subtitle '),
                trailing: Text(
                  '0$index : 00',
                  style: TextStyle(color: Colors.green[500], fontSize: 15),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: 23),
      )),
    );
  }
}
