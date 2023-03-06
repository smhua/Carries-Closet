// import 'dart:html';
import "package:artifact/main.dart";
import 'package:flutter/material.dart';
import 'package:artifact/Screens/open_page.dart';
import 'package:artifact/home_page.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  ProfileFormState createState() {
    return ProfileFormState();
  }
}

class ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // margin: EdgeInsets.all(24),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            //Names
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
              child: Row(
                children: [
                  SizedBox(child: firstNameTextField(), height: 50, width: 150),
                  SizedBox(
                    width: 50,
                  ),
                  SizedBox(child: lastNameTextField(), height: 50, width: 150)
                ],
              ),
            ),

            SizedBox(height: height * 1.0 / 72.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
              child: emailAddressTextField(),
            ),
            SizedBox(height: height * 1.0 / 72.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
              child: phoneNumTextField(),
            ),
            SizedBox(height: height * 1.0 / 72.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
              child: countyTextField(),
            ),
            SizedBox(height: height * 1.0 / 72.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
              child: addressTextField(),
            ),
            SizedBox(height: height * 1.0 / 72.0),
            //City / State info
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
              child: Row(
                children: [
                  SizedBox(
                    child: cityTextField(),
                    height: 50,
                    width: 150,
                  ),
                  SizedBox(width: 50),
                  SizedBox(
                    child: stateTextField(),
                    height: 50,
                    width: 60,
                  )
                ],
              ),
            ),
            SizedBox(height: height * 1.0 / 72.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
              child: zipTextField(),
            ),

            SizedBox(height: height * 1.0 / 72.0),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
                foregroundColor: Colors.black,
                backgroundColor: Color.fromARGB(255, 200, 200, 200),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return OpenPage();
                  })));
                }
              },
              child: const Text('Save'),
            ),
          ],
        )),
      ),
    );
  }
}

Widget firstNameTextField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "First Name",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "First Name is Required";
      }
    },
  );
}

Widget lastNameTextField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "Last Name",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Last Name is Required";
      }
    },
  );
}

Widget emailAddressTextField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "Email Address",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Last Name is Required";
      }
    },
  );
}

Widget phoneNumTextField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "Phone Number",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Phone Number is Required";
      }
    },
  );
}

Widget countyTextField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "County Serving",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "County is Required";
      }
    },
  );
}

Widget addressTextField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "Delivery Address",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Address is Required";
      }
    },
  );
}

Widget cityTextField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "City",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "City is Required";
      }
    },
  );
}

Widget stateTextField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "State",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "State is Required";
      }
    },
  );
}

Widget zipTextField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "Zip Code",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Zip Code is Required";
      }
    },
  );
}
