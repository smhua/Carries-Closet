import 'package:artifact/Screens/open_page.dart';
import "package:flutter/material.dart";
import "package:artifact/main.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 35),
            Row(children: [
              SizedBox(width: 10),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
            ]),
            SizedBox(height: 65),
            Image.asset("assets/dsdf1.png",
                height: 100, width: 100, alignment: Alignment.topCenter),
            SizedBox(height: 50),
            Text(
              "User Login",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 0, top: 0, right: 190, bottom: 0),
              child: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 0, top: 0, right: 200, bottom: 0),
              child: Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
              child: TextField(
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
            ),
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
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
