import "package:artifact/main.dart";
import 'package:flutter/material.dart';
import 'package:artifact/Screens/open_page.dart';

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
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              SizedBox(width: 10),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
            ]),
            SizedBox(
                child: Image(image: AssetImage("assets/dsdf1.png")),
                height: 250,
                width: 250),
            //Names
            Row(
              children: [
                SizedBox(child: firstNameTextField(), height: 50, width: 150),
                SizedBox(
                  width: 50,
                ),
                SizedBox(child: lastNameTextField(), height: 50, width: 150)
              ],
            ),
            emailAddressTextField(),
            phoneNumTextField(),
            countyTextField(),
            addressTextField(),

            //City / State info
            Row(
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

            zipTextField(),

            // SizedBox(
            //   child: zipTextField(),
            //   height: 100,
            //   width: 150,
            // ),

            SizedBox(height: 100),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Color.fromARGB(255, 200, 200, 200),
                textStyle: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return OpenPage();
                })));
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
