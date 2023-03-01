import 'package:artifact/Screens/open_page.dart';
import "package:email_validator/email_validator.dart";
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:artifact/main.dart";
import "package:artifact/Screens/forgot_password.dart";
import "package:artifact/home_page.dart";
import "package:artifact/main.dart";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    iconSize: width * 1.0 / 18.0,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) {
                        return OpenPage();
                      })));
                    },
                    icon: const Icon(Icons.arrow_back)
                  )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/dsdf1.png",
                    height: height * 1.0 / 6.75,
                    width: height * 1.0  / 6.75,
                    alignment: Alignment.center
                  )
                )
              ]
            ),
            SizedBox(height: height * 1.0 / 18.0),
            const Text(
              "User Login",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35, 
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none
              ),
            ),
            SizedBox(height: height * 1.0 / 9.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Please enter a valid email'
                      : null,
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
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                validator: (password) =>
                  password != null
                  ? 'Please enter a password'
                  : null,
                controller: passwordController,
                textInputAction: TextInputAction.done,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 40.0),
              child: TextButton(
                child: const Text('Forgot Password?'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return ForgotPassword();
                  })));
                }
              )
            ),
            SizedBox(height: height * 2.0 / 27.0),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
                foregroundColor: Colors.black,
                backgroundColor: Color.fromARGB(255, 200, 200, 200),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: signIn,
              child: const Text('Login'),
            ),
          ]
        )
      )
    );
  }
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Column(
//           children: [
//             const SizedBox(height: 35),
//             Row(children: [
//               const SizedBox(width: 10),
//               IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.arrow_back)),
//             ]),
//             const SizedBox(height: 65),
//             Image.asset("assets/dsdf1.png",
//                 height: 100, width: 100, alignment: Alignment.topCenter),
//             SizedBox(height: 50),
//             Text(
//               "User Login",
//               style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 0, top: 0, right: 190, bottom: 0),
//               child: Text(
//                 'Username',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your username',
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 0, top: 0, right: 200, bottom: 0),
//               child: Text(
//                 'Password',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
//               child: TextField(
//                 obscureText: true,
//                 obscuringCharacter: '*',
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your password',
//                 ),
//               ),
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.black,
//                 backgroundColor: Color.fromARGB(255, 200, 200, 200),
//                 textStyle: TextStyle(fontSize: 16),
//               ),
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: ((context) {
//                   return HomePage();
//                 })));
//               },
//               child: const Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
