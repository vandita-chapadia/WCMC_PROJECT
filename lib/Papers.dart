import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class Paper extends StatefulWidget {
  @override
  _PaperState createState() => _PaperState();
}

class _PaperState extends State<Paper> {

  List<Department> listDepartment = [
    Department("Maths", "https://www.charusat.ac.in/Downloads/Question-Papers/CSPIT/B-TECH/CE/3rd%20Sem/CE%20201%20DMS%2012%202011.pdf"),
    Department("Wireless Communication", "https://www.charusat.ac.in/Downloads/Question-Papers/CSPIT/B-TECH/CE/3rd%20Sem/CE%20201%20DMS%2012%202011.pdf"),
    Department("Machine Learning", "https://www.charusat.ac.in/Downloads/Question-Papers/CSPIT/B-TECH/CE/3rd%20Sem/CE%20201%20DMS%2012%202011.pdf"),
    Department("Software Engineering", "https://www.charusat.ac.in/Downloads/Question-Papers/CSPIT/B-TECH/CE/3rd%20Sem/CE%20201%20DMS%2012%202011.pdf"),
    Department("Cryptography ", "https://www.charusat.ac.in/Downloads/Question-Papers/CSPIT/B-TECH/CE/3rd%20Sem/CE%20201%20DMS%2012%202011.pdf"),

  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Papers"),
        backgroundColor: Color(0xff885566),
        
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: listDepartment.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
            return InkWell(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
               
                  children: [
                    Text(listDepartment[index].name,style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.white,),
                  ],
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (_) => PDFViewerFromUrl(
                    url: listDepartment[index].urlStr,
                  ),
                ),
              ),
            );
          }),
        )
      ),
    );
  }
}

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key key, @required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF From Url'),
      ),
      body: const PDF(
      ).fromUrl(

        url,

        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}


class Department{
  String name;
  String urlStr;

  Department(this.name, this.urlStr);

}