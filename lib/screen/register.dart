import 'package:firebase_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DaftarPage extends StatefulWidget {
  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController noHpC = TextEditingController();

  void add(){
    FirebaseFirestore.instance.collection("kontak").doc(emailC.text).set({
      'nama' : namaC.text,
      'email': emailC.text,
      'hp'  : noHpC.text,
    });

    namaC.text = '';
    emailC.text = '';
    noHpC.text = '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){},),
      //   actions: <Widget>[
      //     //progress bar
      //   ],
      // ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: namaC,
              decoration: InputDecoration(hintText: "Nama"),
            ),
            SizedBox(height: 10.0,),
            TextField(
              controller: emailC,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(height: 10.0,),
            TextField(
              controller: noHpC,
              decoration: InputDecoration(hintText: "Nomor Ponsel"),
            ),
            SizedBox(height: 10.0,),
            FlatButton(onPressed: add, child: Text("Simpan"),color: kSecondaryColor,)
          ],
        ),
      ),
    );
  }
}
