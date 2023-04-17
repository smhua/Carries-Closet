import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:artifact/home_page.dart";

import 'package:http/http.dart' as http;

class ClothingConfirmationPage extends StatefulWidget {
  final String gender, age, item, size, emergency, address, notes;
  const ClothingConfirmationPage(
      {super.key,
      required this.gender,
      required this.age,
      required this.item,
      required this.size,
      required this.emergency,
      required this.address,
      required this.notes});
  @override
  _ClothingConfirmationPageState createState() {
    return _ClothingConfirmationPageState();
  }
}

class _ClothingConfirmationPageState extends State<ClothingConfirmationPage> {
  @override
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
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back))),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset("assets/dsdf1.png",
                            height: height * 1.0 / 6.75,
                            width: height * 1.0 / 6.75,
                            alignment: Alignment.center))
                  ]),
                  SizedBox(height: height * 1.0 / 18.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: TextFormField(
                      enabled: false,
                      initialValue: widget.gender,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Gender',
                        hintText: 'Enter the gender',
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: TextFormField(
                      enabled: false,
                      initialValue: widget.age,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Age',
                        hintText: 'Enter the age',
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: TextFormField(
                      enabled: false,
                      initialValue: widget.item,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Article of Clothing',
                        hintText: 'Enter the item',
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: TextFormField(
                      enabled: false,
                      initialValue: widget.size,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Size (if needed)',
                        hintText: 'Enter the size or N/A if not needed',
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: TextFormField(
                      enabled: false,
                      initialValue: widget.emergency,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Emergency',
                        hintText: 'Yes or No',
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: TextFormField(
                      enabled: false,
                      initialValue: widget.address,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Address',
                        hintText: 'Enter the address',
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: TextFormField(
                      enabled: false,
                      initialValue: widget.notes,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Other notes',
                        hintText:
                            'Please enter any extra information if needed',
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 36.0),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
                      foregroundColor: Colors.black,
                      backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
                      foregroundColor: Colors.black,
                      backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      submitDB();
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return const HomePage();
                      })));
                    },
                    child: const Text('Submit Request'),
                  ),
                ]))));
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

    var id_url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/requestno?requester=$uid')
        : Uri.parse('http://10.0.2.2:8080/requestno?requester=$uid');

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
      var response = await http.post(url, body: {
        'gender': widget.gender,
        'age': widget.age,
        'item': widget.item,
        'size': widget.size,
        'emergency': widget.emergency,
        'address': widget.address,
        'notes': widget.notes,
        'uid': uid,
        'requestno': request_number
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    });
  }
}
