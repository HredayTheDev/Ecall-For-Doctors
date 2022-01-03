import 'dart:convert';

import 'package:ecalldoc/screens/login.dart';
import 'package:ecalldoc/screens/otp_verify.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:ecalldoc/widget/design.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? _mySelection;

  final String url = "http://192.168.0.121:9010/api/getdepartment";

  List data = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/register.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
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
                        'https://toppng.com/uploads/preview/logo-doctors-logo-black-and-white-vector-11563999612kv1q84czrt.png'),
                    radius: 70,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: TextFormField(
                      controller: _name,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.person, "Full Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter name";
                        }
                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                  Container(
                    width: double.infinity,
                    height: 57,
                    margin: const EdgeInsets.all(15),
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.purple, width: 2)),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: DropdownButton(
                        items: data.map((item) {
                          return DropdownMenuItem(
                            child: Text(
                              item['name'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            value: item['Dept_ID'].toString(),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            _mySelection = newVal;
                          });
                        },
                        value: _mySelection,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: TextFormField(
                      controller: _confirmpassword,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.lock, "Confirm Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter re-password";
                        }
                        if (_password.text != _confirmpassword.text) {
                          return "Password Do not match";
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              registrationUser();
                              dropDownApi();

                              print("Successful");
                            } else {
                              print("Unsuccessfull");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                              //  fixedSize: const Size(50, 100),
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
                        "Already Registered?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            'Login',
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

  DropdownMenuItem<String> buildValueItems(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      );

  Future registrationUser() async {
    var apiUrl = "http://192.168.0.121:9010/api/signup";

    Map mapeddate = {
      'username': _name.text,
      'phone': _phone.text,
      'password': _password.text,
      'usertype': "1",
      'department': "25"
    };

    var datas = await http.post(Uri.parse(apiUrl), body: mapeddate);

    var status = datas.statusCode;
    var bod = datas.body;

    print(bod);
    if (status == 200) {
      print(bod);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => otpVerify()));
    }
  }

  Future<String> dropDownApi() async {
    var res =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody;
    });

    print(resBody);

    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    dropDownApi();
  }
}
