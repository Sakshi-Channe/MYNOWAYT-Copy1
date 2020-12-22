import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'menu_itemModel.dart';

class menu_screen extends StatelessWidget {

  final ValueSetter<ItemModel>_valueSetter;
  menu_screen(this._valueSetter);




  List<ItemModel> products = [
    ItemModel("Mi", 50),
    ItemModel("L", 100),
    ItemModel("Mo", 55),
    ItemModel("K", 10),
    ItemModel("Sp", 50),
    ItemModel("C", 30),
  ];







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index].name),
              trailing: Text("Rs.${products[index].price}", style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),),
              onTap: () {

                    _valueSetter(products[index]);

              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: products.length
      ),
    );
  }
}

