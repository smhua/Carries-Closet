import 'package:artifact/admin_home_page.dart';
import 'package:artifact/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:artifact/home_page.dart";

import 'package:http/http.dart' as http;

class HygieneConfirmationPage extends StatefulWidget {
  final List<dynamic> genders, ages, items, sizes, emergencies, notes;
  const HygieneConfirmationPage(
      {super.key,
      required this.genders,
      required this.ages,
      required this.items,
      required this.sizes,
      required this.emergencies,
      required this.notes});
  @override
  _HygieneConfirmationPageState createState() {
    return _HygieneConfirmationPageState();
  }
}

class _HygieneConfirmationPageState extends State<HygieneConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                top: height * 1.0 / 32.0,
                left: width * 1.0 / 5.0,
                right: width * 1.0 / 5.0,
                bottom: height * 1.0 / 32.0),
            child: SizedBox(
              child: CupertinoButton(
                color: Color(0xFF7EA5F4),
                onPressed: () {
                  submitDB();
                  if (AppUser.isAdmin == PermissionStatus.admin) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const AdminHomePage();
                    })));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const HomePage();
                    })));
                  }
                },
                child: const Text(
                  "Submit Request",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )),
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            // appBar: AppBar(actions: [Actions(actions: <Widget>[]>, child: child)]),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(height: height * 1.0 / 18.0),
              Row(
                children: [
                  Stack(alignment: Alignment.topLeft, children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            iconSize: width * 1.0 / 18.0,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back))),
                  ]),
                  Text(
                    "   Review Order",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: width * 1.0 / 4.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.zero))),
                      onPressed: () {
                        if (AppUser.isAdmin == PermissionStatus.admin) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return const AdminHomePage();
                          })));
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return const HomePage();
                          })));
                        }
                      },
                      child: const Text("Cancel",
                          style: TextStyle(color: Colors.red)))
                ],
              ),
              SizedBox(height: height * 1.0 / 18.0),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 22.0),
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Color(0xFF808080),
                    size: 30,
                  ),
                  Text(
                    "Items",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF808080)),
                  ),
                ],
              ),
              Flexible(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 1.0 / 12.0),
                        child: Card(
                            elevation: 0,
                            color: Color(0xFFF9F9F9),
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xFFD9D9D9)),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomRight: Radius.circular(16))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 1.0 / 55.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Item # $index',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0x00000000),
                                            ),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(width: width * 11.0 / 42.0)
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 1.0 / 12.0,
                                        vertical: height * 1.0 / 55.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Gender: ${widget.genders[index]}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Item: ${widget.items[index]}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Size: ${widget.sizes[index]}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Emergency?: ${widget.emergencies[index]}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Age: ${widget.ages[index]}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Other Notes: ${widget.notes[index]}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      );
                    }),
              ),
              SizedBox(
                height: height * 1.0 / 24.0,
              ),
              Container(
                height: 1.0,
                width: width * 1.0,
                color: Colors.grey,
              ),
              SizedBox(height: height * 1.0 / 32.0),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 22.0),
                  Icon(
                    IconData(0xee2d, fontFamily: 'MaterialIcons'),
                    size: 30,
                    color: Color(0xFF808080),
                  ),
                  Text(
                    "Delivery Time",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF808080)),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 1.0 / 12.0,
                        vertical: height * 1.0 / 36.0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            minimumSize:
                                Size(width * 1.0 / 40.0, height * 1.0 / 50.0),
                            backgroundColor: const Color(0xFFC4DBFE),
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: const Text('Standard Delivery',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2E2E2E),
                                fontSize: 13))),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: height * 1.0 / 36.0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            minimumSize:
                                Size(width * 1.0 / 40.0, height * 1.0 / 50.0),
                            backgroundColor: const Color(0xFFC4DBFE),
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: const Text('As soon as possible',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2E2E2E),
                                fontSize: 13))),
                  ),
                ],
              ),
              Container(
                height: 1.0,
                width: width * 1.0,
                color: Colors.grey,
              ),
              SizedBox(height: height * 1.0 / 32.0),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 22.0),
                  Icon(
                    Icons.location_pin,
                    size: 30,
                    color: Color(0xFF808080),
                  ),
                  Text(
                    "Address",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF808080)),
                  ),
                  SizedBox(width: width * 1.0 / 1.75),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 1.0 / 40.0,
                      horizontal: width * 1.0 / 28.0),
                  child: Text("Name of User"),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 28.0),
                  child: Text("Number of User"),
                ),
              ),
              SizedBox(
                height: height * 1.0 / 32.0,
              ),
              Container(
                height: 1.0,
                width: width * 1.0,
                color: Colors.grey,
              ),
              SizedBox(height: height * 1.0 / 32.0),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 22.0),
                  Icon(
                    Icons.person_outline,
                    color: Color(0xFF808080),
                    size: 30,
                  ),
                  Text(
                    "Contact Information",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF808080)),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 1.0 / 40.0,
                      horizontal: width * 1.0 / 28.0),
                  child: Text("Name of User"),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 28.0),
                  child: Text("Number of User"),
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: height * 1.0 / 40.0),
              //   child: Text("Number of User"),
              // )
            ])));
  }

  Future submitDB() async {
    //print('submit clothing called');
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var url = isIOS
        ? Uri.parse(
            'http://127.0.0.1:8080/requests/clothing/create?requester=$uid')
        : Uri.parse(
            'http://10.0.2.2:8080/requests/clothing/create?requester=$uid');

    var id_url = Uri.parse('http://35.211.220.99/requestno?requester=$uid');

    if (uid == null || uid == "") {
      //print("failed: no current user");
      return;
    }

    await http.get(id_url).then((value) async {
      //var a = json.decode(value.toString());
      //print(a);
      //print(value.body.toString());
      var request_number = value.body.toString().substring(
          value.body.toString().indexOf(':') + 1,
          value.body.toString().indexOf('}'));
      for (var i = 0; i < widget.items.length; i++) {
        var postBody = <String, dynamic>{};
        postBody.addEntries([
          MapEntry('gender', widget.genders[i]),
          MapEntry('age', widget.ages[i]),
          MapEntry('item', widget.items[i]),
          MapEntry('size', widget.sizes[i]),
          MapEntry('emergency', widget.emergencies[i]),
          MapEntry('notes', widget.notes[i]),
          MapEntry('uid', uid),
          MapEntry('requestno', request_number)
        ]);
        var response = await http.post(url, body: postBody);
      }
      // print('Response body: ${response.body}');
    });
  }
}
