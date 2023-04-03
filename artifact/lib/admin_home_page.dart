import 'package:artifact/Screens/admin_request_page.dart';
import 'package:artifact/Screens/full_request_page.dart';
import 'package:artifact/Screens/profile_page.dart';
import 'package:artifact/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:artifact/Screens/hygiene_page.dart';
import 'package:artifact/Screens/clothing_page.dart';
import 'package:artifact/Screens/view_users.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.email;
    final String userEmail;
    userEmail = userId != null ? userId.toString() : "*****@gmail.com";
    const String dummyPassword = "********";
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
          SizedBox(height: height * 1.0 / 15.0),
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
          SizedBox(height: height * 1.0 / 40.0),
          Row(
            children: [
              SizedBox(height: height * 1.0 / 40.0),
              Row(children: [
                SizedBox(width: width * 1.0 / 8.0),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize:
                            Size(width * 11.0 / 32.0, height * 1.0 / 8.0),
                        foregroundColor: Colors.black,
                        backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                        textStyle: const TextStyle(fontSize: 24),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return const ViewUsersPage();
                      })));
                    },
                    child: const Text('View Users')),
                SizedBox(width: width * 1.0 / 16.0),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize:
                            Size(width * 11.0 / 32.0, height * 1.0 / 8.0),
                        foregroundColor: Colors.black,
                        backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                        textStyle: const TextStyle(fontSize: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return const AdminRequestPage();
                      })));
                    },
                    child: const Text('View Requests')),
              ])
            ],
          ),
          SizedBox(height: height * 1.0 / 40.0),
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
              child: const Text('Edit Profile')),
          SizedBox(height: height * 1.0 / 40.0),
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
                  return const FullRequestPage();
                })));
              },
              child: const Text('View Orders')),
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
