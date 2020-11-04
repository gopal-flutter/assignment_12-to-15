import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'SignInComponent/LogInEmail.dart';
import 'DetailPage.dart';
import 'SignInComponent/LogInFieldContainer.dart';
// import 'SignInComponent/LogInPassword.dart';

class MyAppSignInPage extends StatefulWidget {
  @override
  _MyAppSignInPageState createState() => _MyAppSignInPageState();
}

class _MyAppSignInPageState extends State<MyAppSignInPage> {
  final _signInKey = GlobalKey<FormState>();
  TextEditingController _signInEmail = TextEditingController();
  var logInemail;
  TextEditingController _signInPassword = TextEditingController();
  var logInpassword;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool success = false;
  String msg = '';
  String result = '';
  User user;

  @override
  void dispose() {
    super.dispose();
    _signInEmail.dispose();
    _signInPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/2.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              alignment: Alignment.center,
              child: Form(
                key: _signInKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogInFieldContainer(
                      child: TextFormField(
                        controller: _signInEmail,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Enter Your Email Address.";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            logInemail = val;
                          });
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.pink,
                          ),
                          hintText: 'Email',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    LogInFieldContainer(
                      child: TextFormField(
                        controller: _signInPassword,
                        obscureText: true,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Enter Your PassWord .";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            logInpassword = val;
                          });
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.pink,
                          ),
                          border: InputBorder.none,
                          hintText: "Password",
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ButtonTheme(
                      minWidth: size.width * 0.8,
                      height: size.height * 0.07,
                      child: RaisedButton(
                        onPressed: validateSignInForm,
                        color: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    (success)
                        ? Text(
                            msg,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )
                        : Text(''),
                    Text(
                      result,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an Account ?   ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('/MyAppSignUpPage');
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  validateSignInForm() async {
    if (_signInKey.currentState.validate()) {
      _signInKey.currentState.save();
      print(logInemail);
      print(logInpassword);

      try {
        UserCredential res = await auth.signInWithEmailAndPassword(
            email: logInemail, password: logInpassword);

        final User user = res.user;
        var uid = user.uid;
        var useremail = user.email;
        var createtime = user.metadata.creationTime;
        var lastSignInTime = user.metadata.lastSignInTime;

        if (res.user != null) {
          setState(() {
            success = true;
            msg = 'You are Successuly Sign In';
            result = '';

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailPage(useremail, uid, createtime, lastSignInTime);
                },
              ),
            );
          });
        } else {
          success = false;
          msg = 'LogIn Failed';
        }
      } catch (e) {
        print(e.code);
        switch (e.code) {
          case 'wrong-password':
            setState(() {
              result = 'Wrong Password';
              msg = '';
            });
            break;
          case 'too-many-requests':
            setState(() {
              msg = '';
              result = 'You have many time logIn';
            });
            break;
          case 'user-not-found':
            setState(() {
              msg = '';
              result = 'You have not Registered with us yet';
            });
            break;
          default:
        }
      }
    }
  }
}
