import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: <Widget>[
                // MenuIcons(),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Card(
                          elevation: 5,
                          margin: EdgeInsets.all(10.0),
                          child:Container(child: Icon(Icons.question_answer,size: 43.0,color: Colors.blue,),padding: EdgeInsets.all(5.0),)
                      ),
                      Text('Konsultasi'),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12.0),
                        child:Icon(
                          Icons.favorite,
                          color: Colors.blue,
                          size: 50.0,
                        ),
                      ),
                      Text('Info Sehat'),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12.0),
                        child:Icon(
                          Icons.local_hospital,
                          color: Colors.blue,
                          size: 50.0,
                        ),
                      ),
                      Text('Klinik'),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12.0),
                        child:Icon(
                          Icons.add_shopping_cart,
                          color: Colors.blue,
                          size: 50.0,
                        ),
                      ),
                      Text('Rumah Sakit'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
