import 'package:artifact/Screens/open_page.dart';
import 'package:artifact/Screens/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:artifact/main.dart";
import 'package:firebase_core/firebase_core.dart';

import 'package:http/http.dart' as http;

class SignUp_Page extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp_Page> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
          child: Column(
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
                        return OpenPage();
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
          SizedBox(height: height * 1.0 / 13.5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
            child: TextField(
              controller: emailController,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
            ),
          ),
          SizedBox(height: height * 1.0 / 18.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
            child: TextField(
              controller: passwordController,
              // textInputAction: TextInputAction.done,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
          ),
          SizedBox(height: height * 1.0 / 18.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
            child: TextField(
              controller: passwordController,
              // textInputAction: TextInputAction.done,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Re-Enter Password',
                hintText: 'Re-enter your password',
              ),
            ),
          ),
          SizedBox(height: height * 1.0 / 13.5),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
              foregroundColor: Colors.black,
              backgroundColor: Color.fromARGB(255, 200, 200, 200),
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onPressed: signUp,
            child: const Text('Signup'),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(left: 0, top: 0, right: 200, bottom: 0),
          //   child: Text(
          //     'Password',
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
          //   child: TextField(
          //     controller: passwordController,
          //     obscureText: true,
          //     obscuringCharacter: '*',
          //     decoration: InputDecoration(
          //       border: OutlineInputBorder(),
          //       hintText: 'Enter your password',
          //     ),
          //   ),
          // ),

          // const Padding(
          //   padding: EdgeInsets.only(left: 50, top: 0, right: 180, bottom: 0),
          //   child: Text(
          //     'Re-enter Password',
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),

          // const Padding(
          //   padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
          //   child: TextField(
          //     obscureText: true,
          //     obscuringCharacter: '*',
          //     decoration: InputDecoration(
          //       border: OutlineInputBorder(),
          //       hintText: 'Re-enter your password',
          //     ),
          //   ),
          // ),

          // const Padding(
          //   padding: EdgeInsets.only(left: 80, top: 100, right: 80, bottom: 30),
          // child: TextButton(
          //   style: TextButton.styleFrom(
          //     foregroundColor: Colors.black,
          //     backgroundColor: Colors.grey,
          //     textStyle: const TextStyle(fontSize: 20),
          //   ),
          //   onPressed: () {},
          //   child: const Text('Signup'),
          // ),
          // ),
          // new Container(
          //     child: ElevatedButton(
          //   child: Text("Signup",
          //       style: TextStyle(color: Colors.black, fontSize: 16)),
          //   onPressed: null,
          // ))
        ],
      )),
    );
  }

  Future signUp() async {
    print('signing up...');

    var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    print(credential.user!.uid);
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    Uri url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/users/create')
        : Uri.parse('http://10.0.2.2:8080/users/create');

    if (credential.user == null) {
      print("Failed.");
      return;
    }

    var response = await http.post(url, body: {
      'id': credential.user!.uid,
      'email': credential.user!.email,
      'permissions': 'false'
    });
    print("posted response");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: ((context) {
      return const MainPage(isLogin: true);
    })));
  }
}
