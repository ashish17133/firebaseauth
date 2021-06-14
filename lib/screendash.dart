import 'package:firebaseauth/operationpage/edit.dart';
import 'package:firebaseauth/operationpage/update.dart';
import 'package:flutter/material.dart';

import 'operationpage/add.dart';
import 'operationpage/view.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Khatabook"),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/market.jpg"), fit: BoxFit.cover),
              ),
              child: Text("me"),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.black26),
            ),
            Container(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.white70,
                    child: IconButton(
                      icon: Icon(
                        Icons.show_chart,
                        size: 50,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return View();
                        }));
                      },
                    ),
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.white70,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      iconSize: 100,
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return additem();
                        }));
                      },
                    ),
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.white70,
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 30,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return edititem();
                        }));
                      },
                    ),
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.white70,
                    child: IconButton(
                      icon: Icon(
                        Icons.update,
                        size: 30,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return updateitem();
                        }));
                      },
                    ),
                  )),
                ],
              ),
            ),
          ]),
        ));
  }
}
