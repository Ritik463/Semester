import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

import '../global.dart';
import 'home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TextEditingController regdNo = TextEditingController();
  final TextEditingController password = TextEditingController();
  // tryLoggingThisUser() async {
  //   var response = await https.post(
  //       Uri.parse('http://115.240.101.71:8282/CampusPortalSOA/login'),
  //       body: json.encode({
  //         "username": regdNo.text,
  //         "password": password.text,
  //         "MemberType": "S"
  //       }));
  //   var decoded = jsonDecode(response.body);
  //   print(decoded);

  // }

  setCookie(response) {
    String rawCookie = response.headers['set-cookie']!;
    int index = rawCookie.indexOf(';');
    String refreshToken =
        (index == -1) ? rawCookie : rawCookie.substring(0, index);
    int idx = refreshToken.indexOf("=");
    if (kDebugMode) {
      print(refreshToken.substring(idx + 1).trim());
    }
    String cookieID = refreshToken.substring(idx + 1).trim();
    sharedPreferences.setString('cookie', cookieID);
  }

  tryLoggingThisUser() async {
    var response = await https.post(
        Uri.parse('http://115.240.101.51:8282/CampusPortalSOA/login'),
        body: json.encode({
          "username": regdNo.text,
          "password": password.text,
          "MemberType": "S"
        }));
    var decoded = jsonDecode(response.body);
    print(decoded);
    if (decoded["status"].toString().contains("success")) {
      //cookie save
      setCookie(response);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
      sharedPreferences.setBool("isLoggedIn", true);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(decoded["message"])));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(decoded["message"])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Lottie.asset("Animation/2.json", height: 210, width: 210),
                // const Image(
                //     height: 170,
                //     width: 170,
                //     image: AssetImage('images/rr.jpg')),

                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Semester',
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
                const Text(
                  '',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(25, 8, 25, 2),
                  child: TextField(
                    controller: regdNo,
                    autofocus: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        labelText: 'Enter registration number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        filled: true),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 8, 25, 35),
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        labelText: 'Enter password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        filled: true),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 280,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  // padding: EdgeInsets.fromLTRB(9, 8, 25, 10),
                  child: ElevatedButton(
                    //  style: ,
                    onPressed: () {
                      tryLoggingThisUser();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 93, 206)),
                    child: Text('Sign In',
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 10),
                // Row(
                Text(
                  "Forgot Password.?",
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
                //   children: [
                //     Expanded(
                //       child: Container(
                //         height: 1,
                //         color: Colors.grey,
                //       ),
                //     ),
                //     const SizedBox(width: 5),
                //     const Text('sign in with'),
                //     const SizedBox(width: 5),
                //     Expanded(
                //       child: Container(
                //         height: 1,
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 10),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     child: const Text('Google'),
                //   ),
                // ),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     child: const Text('Facebook'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
