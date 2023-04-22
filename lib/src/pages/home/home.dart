import 'dart:convert';
import 'dart:typed_data';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/src/global.dart';
import 'package:flutter_application_4/src/pages/attendance/attendance.dart';
import 'package:flutter_application_4/src/pages/splash.dart';
import 'package:http/http.dart' as https;

import '../../student_model/student_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  @override
  void initState() {
    fetchStudentInfo();
    super.initState();
  }

  Uint8List? list;
  void requestImg() async {
    //login this  user and get Cookie and then call image section.
    try {
      final https.Response response = await https.get(
        Uri.parse(
            'http://115.240.101.51:8282/CampusPortalSOA/image/studentPhoto'),
        headers: {
          'Cookie': 'JSESSIONID=${sharedPreferences.getString('cookie')}',
        },
      );
      // print(profileImage);
      setState(() {
        list = response.bodyBytes;
        print(list);
      });
    } catch (e) {}
  }

  late Student student;

  // late Student student;

  fetchStudentInfo() async {
    //try {
    var response = await https.post(
        Uri.parse('http://115.240.101.51:8282//CampusPortalSOA/studentinfo'),
        headers: {
          "Cookie": "JSESSIONID=${sharedPreferences.getString('cookie')}"
        });
    print(response.body);
    var decoded = jsonDecode(response.body);
    if (decoded["detail"].isEmpty) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SplashScreen()));
    } else {
      requestImg();
      student = Student(
        name: decoded["detail"][0]["name"] ?? "Not given",
        regdNo: decoded["detail"][0]["enrollmentno"] ?? "Not given",
        dob: decoded["detail"][0]["dateofbirth"] ?? "Not given",
        branch: decoded["detail"][0]["branchdesc"] ?? "Not given",
        sec: decoded["detail"][0]["sectioncode"] ?? "Not given",
        email: decoded["detail"][0]["semailid"] ?? "Not given",
        mName: decoded["detail"][0]["mothersname"] ?? "Not given",
        address: decoded["detail"][0]["paddress2"] ?? "Not given",
        bloodgroup: decoded["detail"][0]["bloodgroup"] ?? "Not given",
        caddress3: decoded["detail"][0]["caddress2"] ?? "Not given",
        maritalstatus: decoded["detail"][0]["maritalstatus"] ?? "Not given",
        nationality: decoded["detail"][0]["nationality"] ?? "Not given",
        pNo: decoded["detail"][0]["scellno"] ?? "Not given",
        parentNumber: decoded["detail"][0]["stelephoneno"] ?? "Not given",
        phoneNo: decoded["detail"][0]["scellno"] ?? "Not given",
        pincode: decoded["detail"][0]["ppin"] ?? 0,
      );
    }

    setState(() {
      isLoading = false;
    });

    // setState(() {
    //   name = decoded["detail"][0]["name"];
    //   regdNo = decoded["detail"][0]["enrollmentno"];
    //   sec = decoded["detail"][0]["sectioncode"];
    //   isLoading = false;
    // });
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Align(
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 52,
                            backgroundImage: MemoryImage(list!),
                          ),
                        ),

                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(40),
                        //   child: Image.memory(list!, width: 100),
                        // ),
                      ),
                      Text(student.name!,
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                      Text(student.branch!,
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black)),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(
                            width: 53,
                          ),
                          Container(
                            height: 120,
                            width: 120,
                            color: Colors.black.withOpacity(.2),
                            child: const Image(
                                height: 100,
                                width: 100,
                                image: AssetImage(
                                  "images/exam.png",
                                )),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: 120,
                            width: 120,
                            color: Colors.black.withOpacity(.2),
                            child: const Image(
                                height: 100,
                                width: 100,
                                image: AssetImage(
                                  "images/pi.png",
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 53,
                          ),
                          Container(
                            height: 120,
                            width: 120,
                            color: Colors.black.withOpacity(.2),
                            child: const Image(
                                height: 100,
                                width: 100,
                                image: AssetImage(
                                  "images/e.png",
                                )),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                              height: 120,
                              width: 120,
                              color: Colors.black.withOpacity(.2),
                              child: const Image(
                                  height: 100,
                                  width: 100,
                                  image: AssetImage(
                                    "images/roll-call.png",
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 53,
                          ),
                          Container(
                            height: 120,
                            width: 120,
                            color: Colors.black.withOpacity(.2),
                            child: const Image(
                                height: 100,
                                width: 100,
                                image: AssetImage(
                                  "images/n.png",
                                )),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                              height: 120,
                              width: 120,
                              color: Colors.black.withOpacity(.2),
                              child: const Image(
                                  height: 100,
                                  width: 100,
                                  image: AssetImage(
                                    "images/no.png",
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const Attendencepage()));
                            },
                            child: Text(
                              "get you attendance",
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
