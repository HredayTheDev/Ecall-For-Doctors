import 'package:ecalldoc/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:ecalldoc/widget/design.dart';
import 'package:ecalldoc/screens/dashboard.dart';

import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();

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
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              loginUser();

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

  Future loginUser() async {
    var apiUrl = "http://192.168.0.121:9010/api/login";

    Map mapeddate = {
      'phone': _phone.text,
      'password': _password.text,
      'usertype': "1"
    };

    var datas = await http.post(Uri.parse(apiUrl), body: mapeddate);

    var status = datas.statusCode;

    if (status == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }
}
