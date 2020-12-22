import 'package:flutter/material.dart';
import 'package:nowayt_copy1/payment_page.dart';
class cart_checkout extends StatelessWidget {

  final cart;
  final sum;
  cart_checkout(this.cart,this.sum);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text(cart[index].name),
              trailing: Text("Rs.${cart[index].price}", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),
              onTap: (){

              },
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
          itemCount: cart.length,
          shrinkWrap: true,
        ),
        Divider(),
        RaisedButton(
          textColor: Colors.black,
          color: Colors.lightBlue,
          child: Text("Total : Rs.$sum"),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => payment_gateway()),
            );

          },


        ),


      ],
    );

  }
}

