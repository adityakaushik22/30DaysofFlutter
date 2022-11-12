import 'package:first_app/pages/cart_page.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    // int day = 1;
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: Mythemes.lightTheme(context),
      // debugShowCheckedModeBanner: false,
      darkTheme: Mythemes.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => Loginpage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => Loginpage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
