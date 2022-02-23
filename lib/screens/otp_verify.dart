import 'package:ecalldoc/screens/login.dart';
import 'package:flutter/material.dart';

import 'package:ecalldoc/widget/design.dart';
import 'package:http/http.dart' as http;

class otpVerify extends StatefulWidget {
  @override
  _otpVerifyState createState() => _otpVerifyState();
}

class _otpVerifyState extends State<otpVerify> {
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _otp = TextEditingController();

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
            'Otp Verify',
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
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
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
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: _otp,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.lock, "Otp"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter otp";
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
                            'Verify',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              verifyUser();

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future verifyUser() async {
    // ignore: non_constant_identifier_names
    var apiUrl = "http://192.168.0.121:9010/api/otp-verify";

    Map mapeddate = {'phone': _phone.text, 'code': _otp.text};

    var datas = await http.post(Uri.parse(apiUrl), body: mapeddate);

    var status = datas.statusCode;
    var bod = datas.body;

    // ignore: avoid_print
    print(bod);
    if (status == 200) {
      // ignore: avoid_print
      print(bod);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
