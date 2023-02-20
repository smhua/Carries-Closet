import 'package:artifact/Screens/open_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:artifact/main.dart";
import 'package:artifact/Screens/hygiene_confirmation_page.dart';
import "package:artifact/home_page.dart";
import "package:artifact/main.dart";

class HygienePage extends StatefulWidget {
  const HygienePage({super.key});

  @override
  _HygienePageState createState() {
    return _HygienePageState();
  }
}

class _HygienePageState extends State<HygienePage> {
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final itemController = TextEditingController();
  final sizeController = TextEditingController();
  final emergencyController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();

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
                  SizedBox(height: height * 1.0 / 18.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: TextField(
                      controller: genderController,
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
                    child: TextField(
                      controller: ageController,
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
                    child: TextField(
                      controller: itemController,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Hygenic Item',
                        hintText: 'Enter the item',
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: TextField(
                      controller: sizeController,
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
                    child: TextField(
                      controller: emergencyController,
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
                    child: TextField(
                      controller: addressController,
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
                    child: TextField(
                      controller: notesController,
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
                  SizedBox(height: height * 1.0 / 18.0),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
                      foregroundColor: Colors.black,
                      backgroundColor: Color.fromARGB(255, 200, 200, 200),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return HygieneConfirmationPage(
                          gender: genderController.text,
                          age: ageController.text,
                          item: itemController.text,
                          size: sizeController.text,
                          emergency: emergencyController.text,
                          address: addressController.text,
                          notes: notesController.text,
                        );
                      })));
                    },
                    child: const Text('Confirm'),
                  ),
                ]))));
  }
}
