import 'package:charusat/Papers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class dept extends StatefulWidget {
  @override
  _deptState createState() => _deptState();
}

class _deptState extends State<dept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Department Papers"),
        backgroundColor: Color(0xff885566),

      ),
      body: Center(
          child: GridView.extent(
            primary: false,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            maxCrossAxisExtent: 200.0,
            children: <Widget>[
              RaisedButton(

                  padding: const EdgeInsets.all(8),
                  child: const Text('COMPUTER ENGINEERING', style: TextStyle(fontSize: 20,color: Colors.white)),
                  color: Colors.purple,
                  onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Paper()),
                    );
                  },


              ),
              RaisedButton(
                padding: const EdgeInsets.all(8),
                child: const Text('IT ENGINEERING', style: TextStyle(fontSize: 20,color: Colors.white)),
                color: Colors.purple,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Paper()),
                  );
                },              ),
              RaisedButton(
                padding: const EdgeInsets.all(8),
                child: const Text('ELECTRICAL ENGINEERING', style: TextStyle(fontSize: 20,color: Colors.white)),

                color: Colors.purple,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Paper()),
                  );
                },              ),
              RaisedButton(
                padding: const EdgeInsets.all(8),
                child: const Text('EC ENGINEERING', style: TextStyle(fontSize: 20,color: Colors.white)),

                color: Colors.purple,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Paper()),
                  );
                },              ),
             RaisedButton(
                padding: const EdgeInsets.all(8),
                child: const Text('CIVIL ENGINEERING', style: TextStyle(fontSize: 20,color: Colors.white)),

                color: Colors.purple,
               onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Paper()),
                 );
               },              ),
              RaisedButton(
                padding: const EdgeInsets.all(8),
                child: const Text('MECHANICAL ENGINEERING ', style: TextStyle(fontSize: 20,color: Colors.white)),

                color: Colors.purple,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Paper()),
                  );
                },              ),
            ],
          )),
    );
  }
}













