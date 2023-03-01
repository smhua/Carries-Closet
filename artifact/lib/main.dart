import 'package:artifact/Screens/SignUp_Page.dart';
import 'package:artifact/Screens/hygiene_page.dart';
import 'package:artifact/Screens/login_page.dart';
import 'package:artifact/home_page.dart';
import 'package:artifact/login_widget.dart';
import 'package:english_words/english_words.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:artifact/Screens/open_page.dart';
import 'package:artifact/Screens/hygiene_page.dart';
import 'package:artifact/Screens/profile_page.dart';
import 'Screens/sign_up_page.dart';
import 'admin_login.dart';
import 'home_page.dart';

const AlignmentGeometry topcenter = Alignment.topCenter;
const AlignmentGeometry topleft = Alignment.topLeft;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OpenPage(),
  ));
}

class MainPage extends StatelessWidget {
  final bool isLogin;

  const MainPage({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else if (isLogin) {
              return HomePage();
            } else {
              return HomePage();
            }
            // if (snapshot.hasData) {
            //   return HygienePage();
            // } else if (isLogin) {
            //   return HygienePage();
            // } else {
            //   return HygienePage();
            // }
          },
        ),
      );
}
