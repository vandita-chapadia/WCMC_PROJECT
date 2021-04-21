import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Resourse extends StatefulWidget {
  @override
  _ResourseState createState() => _ResourseState();
}

class _ResourseState extends State<Resourse> {
  var titleList = [
    "Library",
    "Super Computer",
    "Sports tool",
    "Sophos Lab",
    "Electrical devices",
    "Wincell",

  ];

  // Description List Here
  var descList = [
    "Provide Book and reading materials various topics",
    "A supercomputer is a computer with a high level of performance as compared to a general-purpose computer.",
    "Provide all sport  related tool and devices",
    "Sophos develops products for communication endpoint, encryption, network security, email security, mobile security and unified threat management.",
    "Provide all  Electrical related tool and devices",
    "Provided WIFI in all over CHARUSAT Campus",

  ];
  var contactfacultyList = [
    "Ms. Nirmala Patel",
    "Dr. Amit Thakkar",
    "Mr. Rakesh Prajapati",
    "Dr. Parth Goyal",
    "Mr. Jignesh Patoliya",
    "Mr. Ritesh Bhatt",

  ];

  var emailList = [
    "nirmalapatel@charusat.edu.in",
    "amitthkkar@charusat.edu.in",
    "rakeshprajapati@charusat.edu.in",
    "parthgoyal@charusat.edu.in",
    "jigneshpatoliya@charusat.edu.in",
    "riteshbhatt@charusat.edu.in",


  ];

  // Image Name List Here
  var imgList = [
    "images/img1.jpg",
    "images/img2.jpg",
    "images/img3.jpg",
    "images/img4.png",
    "images/img5.jpg",
    "images/img6.jpg",

  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        // App Bar
        title: Text(
          "Resources",

        ),

        elevation: 0,
        backgroundColor: Color(0xff885566),

      ),
      // Main List View With Builder
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(context, imgList[index], titleList[index], descList[index]);
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 200,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.black),
                          ),
                        ),
                        Container(
                          width: width,
                           child:Row(
                             children:[
                               Icon(Icons.person,size: 15,),
                           Text(
                            contactfacultyList[index],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.black),
                          ),
                          ],
                        ),
                    
                        ),
                        Container(
                          width: width,
                           child:Row(
                             children:[
                               Icon(Icons.email,size: 15,),
                           Text(
                            emailList[index],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.black),
                          ),
                                                         ],
                           ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 420,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    },
  );
}