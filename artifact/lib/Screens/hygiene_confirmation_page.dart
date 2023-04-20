import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:artifact/home_page.dart';

import 'package:http/http.dart' as http;

import '../admin_home_page.dart';
import '../app_user.dart';

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
              color: Theme.of(context).primaryColor,
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
              child: const Text("Save"),
            ),
          )),
      body: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
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
                    padding:
                        EdgeInsets.symmetric(vertical: height * 1.0 / 55.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [SizedBox(width: width * 11.0 / 42.0)],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 1.0 / 12.0,
                              vertical: height * 1.0 / 55.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }

  Future submitDB() async {
    //print('submit clothing called');
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var url = Uri.parse(
        'http://35.211.220.99/requests/clothing/create?requester=$uid');

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
