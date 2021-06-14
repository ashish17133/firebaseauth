import 'package:firebaseauth/operationpage/add.dart';
import 'package:flutter/material.dart';

class View extends StatefulWidget {
  View({Key key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Customer Details"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: StreamBuilder(
            stream: store.collection("khatabook").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.size,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue[300],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                      "Customer name:${snapshot.data.docs[position]["CreditorName"]}"),
                                  Text(
                                      "Product:${snapshot.data.docs[position]["Product"]}"),
                                  Text(
                                      "Quantity:${snapshot.data.docs[position]["Quantity"]}"),
                                  Text(
                                      "Rate:${snapshot.data.docs[position]["Rate"]}"),
                                  Text(
                                      "Date:${snapshot.data.docs[position]["Date"]}"),
                                  Text(
                                      "Phone Number:${snapshot.data.docs[position]["Phone No"]}"),
                                  Text(
                                      "Total amount:${snapshot.data.docs[position]["Total Amount"]}"),
                                  Text(
                                      "Credit amount:${snapshot.data.docs[position]["CreditorName"]}"),
                                  Text(
                                      "Remark:${snapshot.data.docs[position]["Remark"]}"),
                                ],
                              ),
                            )),
                      );
                    });
              } else {
                return Text("no data found");
              }
            },
          )),
    );
  }
}
