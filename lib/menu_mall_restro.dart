import 'package:flutter/material.dart';
import 'package:nowayt_copy1/payment_page.dart';
class menu_mall extends StatefulWidget {
  @override
  _menu_mallState createState() => _menu_mallState();
}

class _menu_mallState extends State<menu_mall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NOWAYT'),

        ),

        body:
        Padding(
           padding: EdgeInsets.all(10),
              child: ListView(
               children: <Widget>[
                 Container(
                   child: FlatButton(

                     onPressed:(){
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>payment_gateway ()));
                     },
                     child: Text("Proceed To Payment"),
                     color: Colors.lightBlueAccent,


                   ),


                 )


    ])),
    );
  }
}


