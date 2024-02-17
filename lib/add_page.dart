import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addpage extends StatelessWidget {
   Addpage({super.key});

  String first = '';
  String last = '';
  int born = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'first',
              ),
              onChanged: (text) {
                first = text;                
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'last',
              ),
              onChanged: (text) {
                last = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'born',
              ),
              onChanged: (value) {
                born = int.parse(value);
              },
            ),
            

            ElevatedButton(
              onPressed: () async{
                await _addtofirebase();
                Navigator.pop(context);
              }, 
              child: Text('add'),
            )
          ],
        ),
      ),

    );
  }

  Future _addtofirebase() async{
    final db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": first,
      "last": last,
      "born": born,
    };

    // Add a new document with a generated ID
    await db.collection("users").add(user) ;

  }
}