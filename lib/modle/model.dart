import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore viewuserkhata = FirebaseFirestore.instance;
FirebaseFirestore storedata = FirebaseFirestore.instance;

class Customtextfield extends StatelessWidget {
  String hinttext;
  Icon prefixicon;
  Icon suffixicon;
  bool obsvalue;
  Function onchangevalue;
  Customtextfield(
      {this.obsvalue,
      this.hinttext,
      this.prefixicon,
      this.suffixicon,
      this.onchangevalue});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        obscureText: obsvalue,
        onChanged: onchangevalue,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(width: 3)),
          filled: true,
          fillColor: Colors.white,
          hintText: hinttext,
          prefixIcon: prefixicon,
          suffixIcon: suffixicon,
        ),
      ),
    );
  }
}

class Userdetal {
  String username;
  String email;
  String password;
  Userdetal({this.username, this.email, this.password});
}

class Userkhata {
  String custname;
  String prodname;
  String quantity;
  String date;
  String phonenumber;
  int rate;
  String totalamount;
  String creditamount;
  String remark;
  Userkhata(
      {this.custname,
      this.prodname,
      this.quantity,
      this.date,
      this.phonenumber,
      this.rate,
      this.totalamount,
      this.creditamount,
      this.remark});
}

Future<List<Map<String, String>>> itemtobe() async {
  List<Map<String, String>> itemstore = [];
  await storedata.collection("khatabook").get().then((value) {
    value.docs.forEach((element) {
      itemstore.add({
        'CustomerName': element['CreditorName'],
        //'rate': element['Rate'],
        'docid': element.id,
        'Phone': element['Phone No'],
        'date': element['Date'],
        'camount': element['CreditAmount'],
        'tamount': element['Total Amount'],
        'product': element['Product'],
        'quantity': element['Quantity'],
        'reamrk': element['Remark'],
      });
    });
  });

  //print("${firedata.data.docs[i]['CreditorName']}");
  return itemstore;
}
