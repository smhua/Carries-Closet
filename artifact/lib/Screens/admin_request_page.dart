import 'dart:convert';

import 'package:artifact/Screens/open_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:artifact/main.dart";
import 'package:artifact/Screens/hygiene_confirmation_page.dart';
import "package:artifact/home_page.dart";
import "package:artifact/main.dart";

import 'package:http/http.dart' as http;
// import json;

class AdminRequestPage extends StatefulWidget {
  const AdminRequestPage({super.key});

  @override
  _AdminRequestPageState createState() {
    return _AdminRequestPageState();
  }
}

class _AdminRequestPageState extends State<AdminRequestPage> {
  CollectionReference referenceRequests =
      FirebaseFirestore.instance.collection('requests');

  late Stream<QuerySnapshot> streamRequests;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamRequests = referenceRequests.snapshots();
  }

  Widget build(BuildContext context) {
    // referenceRequests.snapshots();

    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: StreamBuilder<QuerySnapshot>(
          stream: streamRequests,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              viewUsers();
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.connectionState == ConnectionState.active) {
              QuerySnapshot querySnapshot = snapshot.data;
            }
            return Center(child: CircularProgressIndicator());
          },
        )));

    // return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: Scaffold(
    //         body: SingleChildScrollView(
    //             scrollDirection: Axis.vertical,
    //             child: Column(children: [
    //               SizedBox(height: height * 1.0 / 18.0),
    //               Stack(alignment: Alignment.topLeft, children: [
    //                 Align(
    //                     alignment: Alignment.topLeft,
    //                     child: IconButton(
    //                         iconSize: width * 1.0 / 18.0,
    //                         onPressed: () {
    //                           Navigator.push(context,
    //                               MaterialPageRoute(builder: ((context) {
    //                             return HomePage();
    //                           })));
    //                         },
    //                         icon: const Icon(Icons.arrow_back))),
    //                 Align(
    //                     alignment: Alignment.bottomCenter,
    //                     child: Image.asset("assets/dsdf1.png",
    //                         height: height * 1.0 / 6.75,
    //                         width: height * 1.0 / 6.75,
    //                         alignment: Alignment.center))
    //               ]),
    //               RequestCardWidget(),
    //             ]))));
  }

  Future viewUsers() async {
    print('view hygiene called');
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    var url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/requests/hygiene/list')
        : Uri.parse('http://10.0.2.2:8080/requests/hygiene/list');

    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var parsed = json.decode(response.body);
    for (var i in parsed) {
      print(i);
    }
    return parsed;
    // print(parsed[1]);
    // print(parsed[1]['address']);
    // for (var doc in response.body) {
    //   print(doc);
    // }
    // print(parsed[0].)
    // for (var i in parsed) {
    //   print(i);
    // }
  }
}

class RequestCardWidget extends StatelessWidget {
  const RequestCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // User fetchedUser;
    // await Firestore.instance
    //     .collection('user')
    //     .document(id)
    //     .get()
    //     .then((snapshot) {
    //   final User user = User(snapshot);
    //   fetchedUser = user;
    // });

    Future viewUsers() async {
      bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
      var url = isIOS
          ? Uri.parse('http://127.0.0.1:8080/users')
          : Uri.parse('http://10.0.2.2:8080/users');

      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      var parsed = await json.decode(response.body);
      return parsed;
    }

    // var parsed = viewUsers();
    viewUsers().then((parsed) {
      //here
      // return Column(
      //   for (var i in parsed) {
      //     Card(
      //       child: ListTile(
      //           title: Text(parsed[i]['name']),
      //           subtitle: Text(parsed[i]['email']),
      //           trailing: Icon(Icons.more_vert)),
      //     )
      //   }
      // );
      // return Column(
      //     Card(
      //       child: ListTile(
      //           title: Text(parsed[i]['name']),
      //           subtitle: Text(parsed[i]['email']),
      //           trailing: Icon(Icons.more_vert)),
      //     )

      // );
    });

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
