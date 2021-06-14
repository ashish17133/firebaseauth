import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseauth/modle/model.dart';
import 'package:firebaseauth/operationpage/add.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore viewdata = FirebaseFirestore.instance;
List<Map<String, String>> userdata = [];
var _value = 1;
bool loading = true;

class edititem extends StatefulWidget {
  edititem({Key key}) : super(key: key);

  @override
  _edititemState createState() => _edititemState();
}

class _edititemState extends State<edititem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    collectuserdata();
    Timer(Duration(seconds: 3), loadcheck);
  }

  void loadcheck() {
    print("run");
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Update Windows"),
          centerTitle: true,
        ),
        body: loading == true
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Select the user which need to edited: "),
                        DropdownButton(
                          value: _value,
                          items: dropitem(),
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              _value = value;
                            });
                          },
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.green,
                        height: MediaQuery.of(context).size.height / 1.2,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                "Customer name:${userdata[_value]['CustomerName']}",
                                style: TextStyle(fontSize: 22)),
                            Text(
                              "Product name:${userdata[_value]['product']}",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              "Total Amount:${userdata[_value]['tamount']}",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              "Credit Amount:${userdata[_value]['camount']}",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              "Date:${userdata[_value]['date']}",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              "Phone No:${userdata[_value]['phone']}",
                              style: TextStyle(fontSize: 22),
                            ),
                            SizedBox(height: 400),
                            Center(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.amber,
                                  ),
                                  onPressed: () {
                                    store
                                        .collection("khatabook")
                                        .doc(userdata[_value]['docid'])
                                        .delete();
                                    print("Delete code goes here");
                                    setState(() {});
                                  },
                                  child: Text("Delete")),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

void collectuserdata() async {
  userdata = await itemtobe_edit();
  print("user data:$userdata");
}

Future<List<Map<String, String>>> itemtobe_edit() async {
  List<Map<String, String>> itemstore = [];
  await store.collection("khatabook").get().then((value) {
    value.docs.forEach((element) {
      itemstore.add({
        'CustomerName': element['CreditorName'],
        'docid': element.id,
        'Phone': element['Phone No'],
        'date': element['Date'],
        'camount': element['CreditAmount'],
        'tamount': element['Total Amount'],
        'product': element['Product']
      });
    });
  });

  //print("${firedata.data.docs[i]['CreditorName']}");
  return itemstore;
}

List<DropdownMenuItem> dropitem() {
  List<DropdownMenuItem> item = [];
  for (int i = 0; i <= userdata.length - 1; i++) {
    item.add(DropdownMenuItem(
      child: Text("${userdata[i]['CustomerName']}"),
      value: i,
    ));
  }
  return item;
}
