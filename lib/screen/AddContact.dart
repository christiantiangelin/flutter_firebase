// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  AddUser(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      return users
          .doc('ABC123')
          .set({
        'full_name': "Mary Jane",
        'age': 18
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      body: SafeArea(child: FlatButton(
        onPressed: addUser,
        child: Text(
          "Add User",
        ),
      )
      ),
    );
  }
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}


class _ContactPageState extends State<ContactPage> {
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController hpC = TextEditingController();
  String listContact = "List Contact\n";

  _ContactPageState(){
    FirebaseFirestore.instance.collection("kontak").snapshots().listen((event) {
      event.docs.forEach((element) {
        listContact += "${element['nama']} - (${element['email']}) - ${element['hp']}\n";
      });
    });
  }

  void add(){
    FirebaseFirestore.instance.collection("kontak").doc(emailC.text).set({
      'nama' : namaC.text,
      'email': emailC.text,
      'hp'  : hpC.text,
    });

    namaC.text = '';
    emailC.text = '';
    hpC.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Could Firestore Testing"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(controller: namaC, decoration: InputDecoration(hintText: "Nama"),),
            TextField(controller: emailC, decoration: InputDecoration(hintText: "Email"),),
            TextField(controller: hpC, decoration: InputDecoration(hintText: "HP"),),
            RaisedButton(onPressed: add, child: Text("Tambah Kontak"),),
            Text(listContact),
          ],
        ),
      ),
    );
  }
}