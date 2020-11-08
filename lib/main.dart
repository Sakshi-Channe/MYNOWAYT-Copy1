import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'User_signin.dart';


void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('NOWAYT',)
        ),
        floatingActionButton: FloatingActionButton(


          onPressed : () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => User_login()),
            );


          },
          child: Icon(Icons.navigate_next),
          backgroundColor: Colors.blue,
        ),
        body:Center(
          child: Container(
            width: 300,
            height: 300,
            child: Lottie.asset("assets/startpage_shopping.json"),
          ),


        )


    );

  }
}


