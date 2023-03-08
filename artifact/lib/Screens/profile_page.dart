// import 'dart:html';
import 'package:artifact/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  ProfileFormState createState() {
    return ProfileFormState();
  }
}

class ProfileFormState extends State<ProfileForm> {
  static final _formKey = GlobalKey<FormState>();
  static final firstNameController = TextEditingController();
  static final lastNameController = TextEditingController();
  static final emailController = TextEditingController();
  static final phoneController = TextEditingController();
  static final countryController = TextEditingController();
  static final addressController = TextEditingController();
  static final cityController = TextEditingController();
  static final stateController = TextEditingController();
  static final zipController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Column(
            children: [
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
              //Names
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                  child: firstNameTextField()),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: cityTextField(),
                    ),
                    SizedBox(width: 50),
                    SizedBox(
                      height: 50,
                      width: 60,
                      child: stateTextField(),
                    )
                  ],
                ),
              ), //City / State info

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
                  textStyle: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bool isIOS =
                        Theme.of(context).platform == TargetPlatform.iOS;
                    update_user_info(isIOS, context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          )
        ]),
      ),
    ));
  }
}

Future update_user_info(bool isIOS, var context) async {
  var uid = FirebaseAuth.instance.currentUser!.uid;
  if (uid == null || uid == "") {
    print("failed: no current user");
    return;
  }

  Uri url = isIOS
      ? Uri.parse('http://127.0.0.1:8080/users/update?id=$uid')
      : Uri.parse('http://10.0.2.2:8080/users/update?id=$uid');

  var response = await http.patch(url, body: {
    'firstName': ProfileFormState.firstNameController.text,
    'lastName': ProfileFormState.lastNameController.text,
    //email would require special handling to change the firebase auth email, so ignoring for now
    'phone': ProfileFormState.phoneController.text,
    'country': ProfileFormState.countryController.text,
    'address': ProfileFormState.addressController.text,
    'city': ProfileFormState.cityController.text,
    'state': ProfileFormState.stateController.text,
    'zip': ProfileFormState.zipController.text
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  Navigator.push(context, MaterialPageRoute(builder: ((context) {
    return HomePage();
  })));
}

Widget firstNameTextField() {
  return TextFormField(
    controller: ProfileFormState.firstNameController,
    decoration: const InputDecoration(
      labelText: "Full Name",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "First and Last Name is Required";
      }
      return null;
    },
  );
}

Widget emailAddressTextField() {
  return TextFormField(
    controller: ProfileFormState.emailController,
    decoration: const InputDecoration(
      labelText: "Email Address",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Last Name is Required";
      }
      return null;
    },
  );
}

Widget phoneNumTextField() {
  return TextFormField(
    controller: ProfileFormState.phoneController,
    decoration: const InputDecoration(
      labelText: "Phone Number",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Phone Number is Required";
      }
      return null;
    },
  );
}

Widget countyTextField() {
  return TextFormField(
    controller: ProfileFormState.countryController,
    decoration: const InputDecoration(
      labelText: "County Serving",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "County is Required";
      }
      return null;
    },
  );
}

Widget addressTextField() {
  return TextFormField(
    controller: ProfileFormState.addressController,
    decoration: const InputDecoration(
      labelText: "Delivery Address",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Address is Required";
      }
      return null;
    },
  );
}

Widget cityTextField() {
  return TextFormField(
    controller: ProfileFormState.cityController,
    decoration: const InputDecoration(
      labelText: "City",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "City is Required";
      }
      return null;
    },
  );
}

Widget stateTextField() {
  return TextFormField(
    controller: ProfileFormState.stateController,
    decoration: const InputDecoration(
      labelText: "State",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "State is Required";
      }
      return null;
    },
  );
}

Widget zipTextField() {
  return TextFormField(
    controller: ProfileFormState.zipController,
    decoration: const InputDecoration(
      labelText: "Zip Code",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Zip Code is Required";
      }
      return null;
    },
  );
}
