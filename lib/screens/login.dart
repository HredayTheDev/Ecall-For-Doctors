import 'dart:convert';

import 'package:ecalldoc/screens/doctor_profile_card.dart';
import 'package:ecalldoc/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:ecalldoc/widget/design.dart';

import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: const Text(
            'Doctor And Nurse',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkCjzUD4n5u893ZwR3x8q9d4DVGyNCE_b4hw&usqp=CAU'),
                    radius: 70,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: TextFormField(
                      controller: _phone,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(Icons.phone, "Phone No"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter  phone";
                        }
                        if (value.length < 9) {
                          return "Please enter valid phone";
                        }
                        return null;
                      },
                      onSaved: (phone) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: TextFormField(
                      controller: _password,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.lock, "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }

                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              var userId;
                              var data = await loginUser();
                              for (int i = 0; i < data.length; i++) {
                                userId = data[i]["DocNurID"];
                              }
                              loginUser();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DoctorProfileCard(
                                            docNurId: userId,
                                          )));

                              print("Successful");
                            } else {
                              print("Unsuccessfull");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.teal[900],
                               fixedSize: const Size(40, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Don't Have An Account?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Registration()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            'Register',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        style: const ButtonStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<List> loginUser() async {
    var apiUrl = "http://192.168.0.121:9010/api/login";

    Map mapeddate = {
      'phone': _phone.text,
      'password': _password.text,
      'usertype': "1"
    };

    var datas = await http.post(Uri.parse(apiUrl), body: mapeddate);

    var status = datas.statusCode;

    if (status == 200) {
      print(datas.body);
    }
    return jsonDecode(datas.body);
  }
}
