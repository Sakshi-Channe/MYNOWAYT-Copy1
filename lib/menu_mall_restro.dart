import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nowayt_copy1/payment_page.dart';
import 'package:nowayt_copy1/restaurant_class.dart';
class menu_mall extends StatefulWidget {
  int restroid;
  menu_mall({Key key , @required this.restroid}):super(key:key);

  @override
  _menu_mallState createState() => _menu_mallState(restroid);
}


class _menu_mallState extends State<menu_mall> {



  final mall_reference=FirebaseDatabase.instance.reference().child("Restaurants/Mall_Restaurants");
  int restroid;
  _menu_mallState(this.restroid);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   showmenu();
  }


  void showmenu() {

      mall_reference.once().then((DataSnapshot datasnapshot) {
        Map <dynamic,dynamic> values=datasnapshot.value;
         values.forEach((key, value) {
          try {

              Fluttertoast.showToast(
                  msg: "into id block!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.lightBlueAccent,
                  textColor: Colors.black,
                  fontSize: 16.0

              );

          }
          catch (ae) {
            Fluttertoast.showToast(
                msg: "error into id block!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.lightBlueAccent,
                textColor: Colors.black,
                fontSize: 16.0

            );
          }
        });
      });

      //Fluttertoast.showToast(msg: "This is sHowMenu");

  }


  @override

  Widget build(BuildContext context) {
    //List lists=new List();
    return Scaffold(
      body :
        Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
             children: <Widget>[
             Container(
                 alignment: Alignment.center,
                 padding: EdgeInsets.all(10),
                 child: Text("This The Menu For Restaurant id : ${widget.restroid}")
             ),

                   FlatButton(
                     textColor: Colors.blue,
                     child: Text(
                       'Proceed To Payment!',
                       style: TextStyle(fontSize: 20),
                     ),
                     onPressed: () {
                      /* Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => payment_gateway()),
                       );*/

                     },
                   )


            ]
        ))
        /*FutureBuilder(
            future: mall_reference.once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                lists.clear();
                Map<dynamic, dynamic> values = snapshot.data.value;
                values.forEach((key, values) {
                  lists.add(values);
                });
                return new ListView.builder(
                    shrinkWrap: true,
                    itemCount: lists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Name: " + lists[index]["NAME"]),
                            Text("Age: "+ lists[index]["CITY"]),
                          ],
                        ),
                      );
                    });
              }
              return CircularProgressIndicator();
            })*/

    );
  }



}







