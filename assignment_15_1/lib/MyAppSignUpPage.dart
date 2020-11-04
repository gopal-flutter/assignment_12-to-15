import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'SignUpcomponent/Email.dart';
import 'SignUpcomponent/GotoSignInPage.dart';
// import 'SignUpcomponent/PassWord.dart';
import 'Signupcomponent/TextFieldConteiner.dart';

class MyAppSignUpPage extends StatefulWidget {
  @override
  _MyAppSignUpPageState createState() => _MyAppSignUpPageState();
}

class _MyAppSignUpPageState extends State<MyAppSignUpPage> {
  final _signUpKey = GlobalKey<FormState>();
  TextEditingController _signUpEmail = TextEditingController();
  var email;
  TextEditingController _signUpPassword = TextEditingController();
  var password;
  FirebaseAuth auth = FirebaseAuth.instance;
  String massage = '';
  bool succ = false;
  String finalok = '';
  UserCredential user;

  @override
  void dispose() {
    super.dispose();
    _signUpEmail.dispose();
    _signUpPassword.dispose();
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
                key: _signUpKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldContainer(
                      child: TextFormField(
                        controller: _signUpEmail,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Enter Your Email Address.";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            email = val;
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
                    TextFieldContainer(
                      child: TextFormField(
                        controller: _signUpPassword,
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
                            password = val;
                          });
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.pink,
                          ),
                          border: InputBorder.none,
                          hintText: 'PassWord',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ButtonTheme(
                      minWidth: size.width * 0.8,
                      height: size.height * 0.07,
                      child: RaisedButton(
                        onPressed: validateSignUpForm,
                        color: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    GotoSignInPage(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(finalok),
                    Text(massage),
                    // Text(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  validateSignUpForm() async {
    if (_signUpKey.currentState.validate()) {
      _signUpKey.currentState.save();

      print(email);
      print(password);
      try {
        final UserCredential result = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        if (result.user != null) {
          print('okk');
          setState(() {
            finalok = 'Sign Up Succesful';
            massage = '';
          });

          Navigator.of(context)
              .pushNamedAndRemoveUntil('/MyAppSignInPage', (route) => false);
        } else {
          print('error..');
        }
      } catch (e) {
        print(e.code);
        switch (e.code) {
          case 'weak-password':
            setState(() {
              massage = 'Weak Password';
              finalok = '';
            });
            break;
          case 'invalid-email':
            setState(() {
              finalok = '';
              massage = 'Invalid Email Id';
            });
            break;
          case 'email-already-in-use':
            setState(() {
              finalok = '';
              massage = 'Email Already Registed';
            });
            break;
          default:
        }
      }
    }
  }
}
