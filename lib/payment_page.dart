import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class payment_gateway extends StatefulWidget {
  @override
  _payment_gatewayState createState() => _payment_gatewayState();
}

class _payment_gatewayState extends State<payment_gateway> {
  Razorpay razorpay;
  TextEditingController textEditingController=new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay=new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentsuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, paymenterror);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalwallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_ulkzAIvEDfGzPf",
      "amount": num.parse(textEditingController.text) * 100,
      "name": "Nowayt",
      "description": "Payment for the some random product",
      "prefill": {
        "contact": "7721961357",
        "email": "tanmaidmuke@gmail.com"
      },
      "external": {
        "wallets": ["paytm"]
      }
    };

    try{
      razorpay.open(options);
    }
    catch(e){
      print(e.toString());
    }



  }

  void paymentsuccess(){
    Fluttertoast.showToast(
        msg: "Payment Sucessful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightBlueAccent,
        textColor: Colors.black,
        fontSize: 16.0

    );

  }
  void paymenterror(){
    Fluttertoast.showToast(
        msg: "Payment Failed!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightBlueAccent,
        textColor: Colors.black,
        fontSize: 16.0

    );
  }
  void externalwallet(){
    Fluttertoast.showToast(
        msg: "External Wallet!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightBlueAccent,
        textColor: Colors.black,
        fontSize: 16.0

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Razor Pay Tutorial"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                  hintText: "Amount to pay"
              ),
            ),
            SizedBox(height: 12,),
            RaisedButton(
              color: Colors.blue,
              child: Text("Pay Now", style: TextStyle(
                  color: Colors.white
              ),),
              onPressed: (){
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}
