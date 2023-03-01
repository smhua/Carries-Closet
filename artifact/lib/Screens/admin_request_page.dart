import 'package:artifact/Screens/open_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:artifact/main.dart";
import 'package:artifact/Screens/hygiene_confirmation_page.dart';
import "package:artifact/home_page.dart";
import "package:artifact/main.dart";

class AdminRequestPage extends StatefulWidget {
  const AdminRequestPage({super.key});

  @override
  _AdminRequestPageState createState() {
    return _AdminRequestPageState();
  }
}

class _AdminRequestPageState extends State<AdminRequestPage> {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  SizedBox(height: height * 1.0 / 18.0),
                  Stack(alignment: Alignment.topLeft, children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            iconSize: width * 1.0 / 18.0,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return HomePage();
                              })));
                            },
                            icon: const Icon(Icons.arrow_back))),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset("assets/dsdf1.png",
                            height: height * 1.0 / 6.75,
                            width: height * 1.0 / 6.75,
                            alignment: Alignment.center))
                  ]),
                  RequestCardWidget(),
                ]))));
  }
}

class RequestCardWidget extends StatelessWidget {
  const RequestCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text("Request #1"),
            subtitle: Text("3/1/2023"),
            trailing: Icon(Icons.more_vert),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Article of Clothing:"), Text("Size")],
          ),
          Text("Gender"),
          Text("Address"),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            ElevatedButton(
              child: const Text('Complete'),
              onPressed: null,
            ),
            const SizedBox(width: 8),
            TextButton(
              child: const Text('Deny'),
              onPressed: null,
            ),
            const SizedBox(width: 8),
          ])
        ],
      ),
    ));
  }
}
