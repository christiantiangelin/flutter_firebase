import 'package:firebase_app/constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{
  TextEditingController searchController = TextEditingController();
  GlobalKey <FormState> formKey = GlobalKey <FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            title: Text("Healing App"),
            actions: <Widget>[
              FlatButton(
                child: Text("Login"),
                onPressed: () {
                },
              ),
            ],
          ),
          body: new Column(
            children: <Widget>[
              Container(
                height: size.height *0.2,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: size.height *0.2-27,
                      decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                            child: Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(width: 10.0,),
                                Text("Manado"),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal : 20.0,vertical: 5.0),
                            child: Text(" Selamat Datang",style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left:0,
                      right:0,
                      child: Container(
                        margin : EdgeInsets.symmetric(horizontal: 20.0),
                        height: 54,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: kSecondaryColor.withOpacity(0.23),
                            )]
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding : EdgeInsets.only(left: 20.0),
                                child: TextField(
                                  onChanged: (value){
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(builder: (context) => Search())
                                    // );
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(padding: EdgeInsets.only(right: 20.0),child: Icon(Icons.search)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              SkeletonAnimation(
                child: Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            onPressed: (){},
            tooltip: 'Buat Janji',
            child: Icon(Icons.add),
          ),
      ),
    );
  }
}

