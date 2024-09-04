import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestGetScreen extends StatefulWidget {
  const RestGetScreen({super.key});

  @override
  State<RestGetScreen> createState() => _RestGetScreenState();
}

class _RestGetScreenState extends State<RestGetScreen> {
  List<dynamic> phoneDetails = [];
  bool isLoading = false;

  //fn to fetch data from api
  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('https://api.restful-api.dev/objects');
    final responce = await http.get(url);

    if (responce.statusCode == 200) {
      final List<dynamic> data = json.decode(responce.body);
      setState(() {
        phoneDetails = data;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('GET - REST'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.green)),
                        onPressed: fetchData,
                        child: Text(
                          'Get Values',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                    SizedBox(height: 8),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            final item = phoneDetails[index];
                            final name = item['name'] ?? 'Unknown Device';
                            final id = item['id'] ?? 'N/A';
                            final color = item['color'] ?? 'No colours given ';
                            final capacity =
                                item['capacity'] ?? 'Not Available';

                            return ListTile(
                              title: Text(name),
                              subtitle: Text(
                                  'ID : $id \nColor : $color \nCapacity : $capacity \n'),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: phoneDetails.length),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
