import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Resultstudent extends StatefulWidget {
  @override
  _ResultstudentState createState() => _ResultstudentState();
}

class _ResultstudentState extends State<Resultstudent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
          child:Card(
            color: Colors.purple[100],
      child: Column(

        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(

            leading: Icon(Icons.scatter_plot_sharp
                , size: 50,color: Colors.black,),
            title: Text('Unit Test Result'),
            subtitle: Text('2IT (2020-2021)'),
          ),
        ],
      ),
    ),
      onTap: ()async {
          if (await canLaunch("https://docs.google.com/spreadsheets/d/1hN1vB0onXOvXhIYDayKjMm9X5qWL9AnOicBFhaY4xho/htmlview")) {
        await launch("https://docs.google.com/spreadsheets/d/1hN1vB0onXOvXhIYDayKjMm9X5qWL9AnOicBFhaY4xho/htmlview");
        }
      },

    ),
          InkWell(
            child:Card(
              color: Colors.purple[100],
              child: Column(

                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(

                    leading: Icon(Icons.scatter_plot_sharp
                      , size: 50,color: Colors.black,),
                    title: Text('Unit Test Result'),
                    subtitle: Text('4IT (2020-2021)'),
                  ),
                ],
              ),
            ),
            onTap: ()async {
              if (await canLaunch("https://docs.google.com/spreadsheets/d/1hN1vB0onXOvXhIYDayKjMm9X5qWL9AnOicBFhaY4xho/htmlview")) {
                await launch("https://docs.google.com/spreadsheets/d/1hN1vB0onXOvXhIYDayKjMm9X5qWL9AnOicBFhaY4xho/htmlview");
              }
            },

          ),
          InkWell(
            child:Card(
              color: Colors.purple[100],
              child: Column(

                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(

                    leading: Icon(Icons.scatter_plot_sharp
                      , size: 50,color: Colors.black,),
                    title: Text('Unit Test Result'),
                    subtitle: Text('6IT (2020-2021)'),
                  ),
                ],
              ),
            ),
            onTap: ()async {
              if (await canLaunch("https://docs.google.com/spreadsheets/d/1hN1vB0onXOvXhIYDayKjMm9X5qWL9AnOicBFhaY4xho/htmlview")) {
                await launch("https://docs.google.com/spreadsheets/d/1hN1vB0onXOvXhIYDayKjMm9X5qWL9AnOicBFhaY4xho/htmlview");
              }
            },

          ),
          InkWell(
            child:Card(
              color: Colors.purple[100],
              child: Column(

                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(

                    leading: Icon(Icons.scatter_plot_sharp
                      , size: 50,color: Colors.black,),
                    title: Text('Unit Test Result'),
                    subtitle: Text('8IT (2020-2021)'),
                  ),
                ],
              ),
            ),
            onTap: ()async {
              if (await canLaunch("https://docs.google.com/spreadsheets/d/1hN1vB0onXOvXhIYDayKjMm9X5qWL9AnOicBFhaY4xho/htmlview")) {
                await launch("https://docs.google.com/spreadsheets/d/1hN1vB0onXOvXhIYDayKjMm9X5qWL9AnOicBFhaY4xho/htmlview");
              }
            },

          ),
        ],
      ),
    );
  }
}
