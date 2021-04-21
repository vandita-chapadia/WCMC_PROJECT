import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Login.dart';
import './color.dart';
import './fade_animation.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _password, _phone, _confirm_password;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          await _auth.currentUser.updateProfile(displayName: _name);
        }
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Educator SignUp", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(1.8, Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10)
                                )
                              ]
                          ),

                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                ),
                                child: TextFormField(
                                    validator: (input) {
                                      if (input.isEmpty) return 'Enter Name';
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Full Name",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                    onSaved: (input) => _name = input),
                              ),

                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                ),
                                child: TextFormField(
                                    validator: (input) {
                                      if (input.isEmpty) return 'Enter Email';
                                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(input)) {
                                        return 'Please enter a valid email address';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Faculty Email address",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                    onSaved: (input) => _email = input
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (input) {
                                      if (input.isEmpty) return 'Enter Phone Number';
                                      if(input.length < 10 || input.length > 10)
                                      {
                                        return 'Enter valid 10 digit phone number';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Phone Number",
                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                    ),
                                    onSaved: (input) => _phone = input),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                    controller: _passwordController,
                                    validator: (input) {
                                      if (input.length < 6)
                                        return 'Provide Minimum 6 Character';
                                      Pattern pattern =
                                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                      RegExp regex = new RegExp(pattern);
                                      print(input);
                                      if (!regex.hasMatch(input))
                                        return 'Enter valid password';
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                    obscureText: true,
                                    onSaved: (input) => _password = input
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                    controller: _confirmPasswordController,
                                    validator: (input) {
                                      if (input != _passwordController.text)
                                        return 'Password doesnot match';
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Confirm Password",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                    obscureText: true,
                                    onSaved: (input) => _confirm_password = input
                                ),
                              ),


                            ],
                          ),
                        )),
                        SizedBox(height: 30,),
                        MaterialButton(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, .6),
                                    ]
                                )
                            ),
                            child: Center(
                              child: Text("SignUp", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                            ),
                          ),
                          onPressed: signUp,
                        ),


                        SizedBox(height: 10,),

                        MaterialButton(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, .6),
                                    ]
                                )
                            ),
                            child: Center(
                              child: Text("Already have an account?Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                            ),
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                        )
                      ],
                    ),
                  ),

                ),

              ],
            ),
          ),
        )
    );
  }
}