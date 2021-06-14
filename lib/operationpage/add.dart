import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseauth/modle/model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Userkhata adduserdetal = Userkhata();
FirebaseFirestore store = FirebaseFirestore.instance;

class additem extends StatefulWidget {
  additem({Key key}) : super(key: key);

  @override
  _additemState createState() => _additemState();
}

class _additemState extends State<additem> {
  var datepicked = null;
  Future<void> datepicker(BuildContext context) async {
    final DateTime pickeddate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2025));
    setState(() {
      datepicked = pickeddate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Add Customer"),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.blue[400],
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "CUSTOMER DETAILS",
                        style: TextStyle(fontSize: 34),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            adduserdetal.custname = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Cerditor Name",
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Product Name",
                              filled: true,
                              fillColor: Colors.white),
                          onChanged: (value) {
                            adduserdetal.prodname = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            adduserdetal.quantity = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Quantity",
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            adduserdetal.date = value;
                          },
                          decoration: InputDecoration(
                              hintText: (datepicked == null)
                                  ? "Date"
                                  : datepicked.toString(),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    await datepicker(context);
                                    adduserdetal.date = datepicked.toString();
                                  },
                                  icon: Icon(Icons.date_range))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            adduserdetal.phonenumber = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Phone Number",
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            adduserdetal.rate = int.parse(value);
                          },
                          decoration: InputDecoration(
                              hintText: "Rate",
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                adduserdetal.totalamount = value;
                              },
                              decoration: InputDecoration(
                                  hintText: "Total Amount",
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: TextField(
                                onChanged: (value) {
                                  adduserdetal.creditamount = value;
                                },
                                decoration: InputDecoration(
                                    hintText: "Credit Amount",
                                    filled: true,
                                    fillColor: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            adduserdetal.remark = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Remark",
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await writedata();
                              },
                              child: Text("SAVE"),
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                            )
                          ])
                    ],
                  ),
                ),
              ),
            )));
  }
}

Future<void> writedata() async {
  await store.collection("khatabook").add({
    "CreditAmount": adduserdetal.creditamount,
    "CreditorName": adduserdetal.custname,
    "Phone No": adduserdetal.phonenumber,
    "Product": adduserdetal.prodname,
    "Quantity": adduserdetal.quantity,
    "Rate": adduserdetal.rate,
    "Remark": adduserdetal.remark,
    "Total Amount": adduserdetal.totalamount,
    "Date": adduserdetal.date,
  });
}
