import 'package:artifact/Screens/profile_page.dart';
import 'package:artifact/Screens/user_request_page.dart';
import 'package:artifact/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:artifact/Screens/hygiene_page.dart';
import 'package:artifact/Screens/clothing_page.dart';
import 'package:artifact/Screens/user_request_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.email;
    final userEmail = userId != null ? userId.toString() : "*****@gmail.com";
    final String dummyPassword = "password";
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Column(children: [
          SizedBox(height: height * 1.0 / 13.5),
          Row(textDirection: TextDirection.rtl, children: [
            SizedBox(width: width * 1.0 / 12.0),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(width * 1.0 / 6.0, height * 1.0 / 27.0),
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                    textStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const MainPage(isLogin: true);
                  })));
                },
                child: const Text('Logout'))
          ]),
          Image.asset("assets/dsdf1.png",
              alignment: Alignment.topCenter,
              width: width * 2.0 / 3.0,
              height: width * 2.0 / 3.0),
          SizedBox(height: height * 1.0 / 6.0),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  minimumSize: Size(width * 3.0 / 4.0, height * 1.0 / 14.0),
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                  textStyle: const TextStyle(fontSize: 24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => requestPopUp(context));
              },
              child: const Text('Submit a Request')),
          SizedBox(height: height * 1.0 / 25.0),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  minimumSize: Size(width * 3.0 / 4.0, height * 1.0 / 14.0),
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                  textStyle: const TextStyle(fontSize: 24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return ProfileForm(email: userEmail, password: dummyPassword);
                })));
              },
              child: const Text('Edit your Profile')),
          SizedBox(height: height * 1.0 / 25.0),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  minimumSize: Size(width * 3.0 / 4.0, height * 1.0 / 14.0),
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                  textStyle: const TextStyle(fontSize: 24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const UserRequestsPage();
                })));
              },
              child: const Text('View my Requests')),
        ])));
  }
  
  Widget requestPopUp(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return AlertDialog(
        //title: const Text('Please select the type of request form:'),
        actions: [
          SizedBox(height: height * 1.0 / 40.0),
          const Text('What type of item are you requesting?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: height * 1.0 / 40.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  minimumSize: Size(width * 7.0 / 24.0, height * 1.0 / 10.0),
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const ClothingPage();
                })));
              },
              child: const Text('Clothing'),
            ),
            SizedBox(width: width * 1.0 / 12.0),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(width * 7.0 / 24.0, height * 1.0 / 10.0),
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const HygienePage();
                  })));
                },
                child: const Text('Hygiene'))
          ]),
          SizedBox(height: height * 1.0 / 40.0)
        ]);
  }
}