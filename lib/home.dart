import 'package:charusat/logout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:charusat/Resourse.dart';
import 'package:charusat/Resultstudent.dart';
import 'package:charusat/dept.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './color.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  Card topArea() => Card(
      margin: EdgeInsets.all(10.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      child: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Color(0xFF0288D1), Color(0xFF0288D1)])),
        padding: EdgeInsets.all(5.0),
        // color: Color(0xFF015FFF),
      )
  );
  int selectedPage = 0;

  final _pageOptions = [
    Resourse(),
    dept(),
    Resultstudent(),
    Logout(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.book, size: 30), title: Text('Resource')),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark, size: 30), title: Text(' University Papers')),
            BottomNavigationBarItem(icon: Icon(Icons.scatter_plot, size: 30), title: Text('UT Results')),
            BottomNavigationBarItem(icon: Icon(Icons.logout, size: 30), title: Text('Logout')),


          ],
          selectedItemColor: Colors.purple,
          elevation: 5.0,
          unselectedItemColor: Colors.purple[900],
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index){

            setState(() {

              selectedPage = index;
            });
          },
        )
    );
  }
}

