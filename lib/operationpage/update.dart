import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseauth/modle/model.dart';
import 'package:firebaseauth/operationpage/edit.dart';
import 'package:flutter/material.dart';

var userdataforup;
bool loading = true;
int _value = 1;
FirebaseFirestore datastore = FirebaseFirestore.instance;
var docdata = datastore.collection("khatabook");

//instance of userdata
Userkhata updateuserkhata = Userkhata();

class updateitem extends StatefulWidget {
  updateitem({Key key}) : super(key: key);

  @override
  _updateitemState createState() => _updateitemState();
}

class _updateitemState extends State<updateitem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataupdate();
  }

  void dataupdate() async {
    userdataforup = await itemtobe();
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
          centerTitle: true,
          title: Text("Update"),
        ),
        body: loading == true
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: Container(
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
                        Row(
                          children: [
                            Text("Select customer: "),
                            DropdownButton(
                              value: _value,
                              items: itemdrop(),
                              onChanged: (value) {
                                _value = value;
                                setState(() {});
                              },
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {
                              updateuserkhata.custname = value;
                            },
                            decoration: InputDecoration(
                                hintText:
                                    "${userdataforup[_value]['CustomerName']}",
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "${userdataforup[_value]['product']}",
                                filled: true,
                                fillColor: Colors.white),
                            onChanged: (value) {
                              updateuserkhata.prodname = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {
                              updateuserkhata.quantity = value;
                            },
                            decoration: InputDecoration(
                                hintText:
                                    "${userdataforup[_value]['quantity']}",
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {
                              updateuserkhata.date = value;
                            },
                            decoration: InputDecoration(
                                hintText: "${userdataforup[_value]['date']}",
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: IconButton(
                                    onPressed: () async {},
                                    icon: Icon(Icons.date_range))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {
                              updateuserkhata.phonenumber = value;
                            },
                            decoration: InputDecoration(
                                hintText: "${userdataforup[_value]['Phone']}",
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {
                              updateuserkhata.rate = int.parse(value);
                            },
                            decoration: InputDecoration(
                                hintText: "${userdataforup[_value]["rate"]}",
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
                                  updateuserkhata.totalamount = value;
                                },
                                decoration: InputDecoration(
                                    hintText:
                                        "${userdataforup[_value]['tamount']}",
                                    filled: true,
                                    fillColor: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: TextField(
                                  onChanged: (value) {
                                    updateuserkhata.creditamount = value;
                                  },
                                  decoration: InputDecoration(
                                      hintText:
                                          "${userdataforup[_value]['camount']}",
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
                              updateuserkhata.remark = value;
                            },
                            decoration: InputDecoration(
                                hintText: "${userdataforup[_value]['reamrk']}",
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  //condition for no change value;

                                  docdata
                                      .doc(userdataforup[_value]['docid'])
                                      .update({
                                    "CreditorName": updateuserkhata.custname ==
                                            null
                                        ? userdataforup[_value]['CustomerName']
                                        : updateuserkhata.custname,
                                    "CreditAmount":
                                        updateuserkhata.creditamount == null
                                            ? userdataforup[_value]['camount']
                                            : updateuserkhata.creditamount,
                                    "Date": updateuserkhata.date == null
                                        ? userdataforup[_value]['date']
                                        : updateuserkhata.date,
                                    "Phone No":
                                        updateuserkhata.phonenumber == null
                                            ? userdataforup[_value]['Phone']
                                            : updateuserkhata.phonenumber,
                                    "Product": updateuserkhata.prodname == null
                                        ? userdataforup[_value]['product']
                                        : updateuserkhata.prodname,
                                    "Quantity": updateuserkhata.quantity == null
                                        ? userdataforup[_value]['quantity']
                                        : updateuserkhata.quantity,
                                    "Rate": updateuserkhata.rate == null
                                        ? userdataforup[_value]["rate"]
                                        : updateuserkhata.rate,
                                    "Total Amount":
                                        updateuserkhata.totalamount == null
                                            ? userdataforup[_value]['tamount']
                                            : updateuserkhata.totalamount,
                                    "Remark": updateuserkhata.remark == null
                                        ? userdataforup[_value]['reamrk']
                                        : updateuserkhata.remark,
                                  });
                                },
                                child: Text("Update"),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                              )
                            ])
                      ],
                    ),
                  ),
                ),
              )),
      ),
    );
  }
}

List<DropdownMenuItem<dynamic>> itemdrop() {
  List<DropdownMenuItem> retrunitem = [];
  for (int i = 0; i <= userdataforup.length - 1; i++) {
    retrunitem.add(DropdownMenuItem(
      child: Text("${userdataforup[i]["CustomerName"]}"),
      value: i,
    ));
  }
  return retrunitem;
}
