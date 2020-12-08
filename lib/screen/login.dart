import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  String info = "";

  void loginGoogle(){
    googleSignIn().then((FirebaseAuth user){
      // if(user!=null){
      //
      // }
      setState((){
        info = "${user.currentUser.displayName} (${user.currentUser.email})";
      });
    }).catchError((e)=> print(e.toString()));
  }

  Future<FirebaseAuth> googleSignIn() async{
    GoogleSignInAccount gsia = await GoogleSignIn().signIn();
    GoogleSignInAuthentication gsiaAuth = await gsia.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: gsiaAuth.idToken,
      accessToken: gsiaAuth.accessToken,
    );

    FirebaseAuth user = (await FirebaseAuth.instance.signInWithCredential(credential)).user as FirebaseAuth;
    return user;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onSaved: (value) => _email = value,
                      controller: usernameC,
                      decoration: InputDecoration(hintText: "Username"),),
                    TextFormField(
                      onSaved: (value) => _password = value,
                      controller: passwordC,
                      decoration: InputDecoration(hintText: "Password"),),
                    SizedBox(height: 10,),
                    RaisedButton(
                      onPressed: (){
                        // save the fields..
                        final form = _formKey.currentState;
                        form.save();

                        // Validate will return true if is valid, or false if invalid.
                        if (form.validate()) {
                          print("$_email $_password");
                        }
                      },
                      child: Text("Login"),),
                    // Spacer(),
                  ],
                ),
              ),
            ),
            // RaisedButton(
            //   child: Text("Login Google"),
            //   onPressed: LoginGoogle,
            // ),
            SignInButton(
              Buttons.Google,
              text: "Login dengan Google",
              onPressed: loginGoogle,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text("Anda belum punya akun? "),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/daftar');
                      },
                        child: Text("Daftar Sekarang",style: TextStyle(color: Colors.blue[800]),)
                    ),
                  ],
                )
            ),
            Text(info),
          ],
        ),
      ),
    );
  }
}
