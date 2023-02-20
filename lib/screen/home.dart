
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> User = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Flutter REST API Call"),
      ),
      body: ListView.builder(
        itemCount: User.length,
        itemBuilder:(context, index) {
          final user = User[index];
          final email =user['email'];
        return ListTile(
          leading: Text('$index'),
          title: Text(email),
        );
      }, ),
      floatingActionButton:
      FloatingActionButton(
      onPressed: (){fetchUser();},
      child: Icon(Icons.add),),
    );
  }
  fetchUser()async {
    print('hello sourav');
    const url ='https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = response.body;
 final json = jsonDecode(body);
 setState(() {
   User = json('response');
 });
  }
}