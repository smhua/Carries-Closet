import "package:flutter/material.dart";
import "package:artifact/main.dart";
import 'package:artifact/Screens/hygiene_page.dart';
import 'package:artifact/Screens/signup_page.dart';

class OpenPage extends StatefulWidget {
  @override
  _OpenPageState createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/dsdf1.png",
                    alignment: topcenter,
                    width: width * 3.0 / 4.0,
                    height: width * 3.0 / 4.0),
                Column(
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize:
                                Size(width * 1.0 / 2.0, height * 1.0 / 9.0),
                            foregroundColor: Colors.black,
                            backgroundColor: Color.fromARGB(255, 200, 200, 200),
                            textStyle: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return MainPage(isLogin: isLogin);
                          })));
                        },
                        child: Text("Login",
                            style: TextStyle(color: Colors.black))),
                    SizedBox(height: height * 1.0 / 18.0),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize:
                                Size(width * 1.0 / 2.0, height * 1.0 / 9.0),
                            foregroundColor: Colors.black,
                            backgroundColor: Color.fromARGB(255, 200, 200, 200),
                            textStyle: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return MainPage(isLogin: !isLogin);
                          })));
                        },
                        child: Text("Signup",
                            style: TextStyle(color: Colors.black))),
                  ],
                )
              ],
            )));
  }
}
// class OpenPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // double densityAmt = 0.0;
//     //   VisualDensity density = VisualDensity(horizontal: densityAmt, vertical: densityAmt);
//     return MaterialApp(
//       // theme: ThemeData(visualDensity: density),
//       home: Scaffold(
//         body: Container(
//             alignment: Alignment.center,
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(
//                   height: 100,
//                 ),
//                 Image.asset("assets/dsdf1.png",
//                     height: 350, width: 350, alignment: topcenter),
//                 SizedBox(
//                   height: 100,
//                 ),
//                 Column(children: [
//                   OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                           minimumSize: Size(280, 80),
//                           textStyle: TextStyle(fontSize: 28)),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: ((context) {
//                           return LoginPage();
//                         })));
//                       },
//                       child:
//                           Text("Login", style: TextStyle(color: Colors.black))),
//                   SizedBox(height: 50),
//                   OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                           minimumSize: Size(280, 80),
//                           textStyle: TextStyle(fontSize: 28)),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: ((context) {
//                           return MyApp();
//                         })));
//                       },
//                       child: Text(
//                         "Signup",
//                         style: TextStyle(color: Colors.black),
//                       )),
//                 ])
//               ],
//             )
//           )
//         )
//       );
//   }
// }
