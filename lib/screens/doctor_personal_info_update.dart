//import 'package:ecalldoc/screens/doctor_personal_info.dart';
import 'package:ecalldoc/models/personal_info.dart';

import 'package:flutter/material.dart';

import 'package:ecalldoc/widget/design.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class DoctorPersonalInfoUpdate extends StatefulWidget {
  String id;
  DoctorPersonalInfoUpdate({Key? key, required this.id}) : super(key: key);

  @override
  _DoctorPersonalInfoUpdateState createState() =>
      _DoctorPersonalInfoUpdateState();
}

class _DoctorPersonalInfoUpdateState extends State<DoctorPersonalInfoUpdate> {
  final TextEditingController _registrationNumber = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _userName = TextEditingController();

  final TextEditingController _phone = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _bloodGroup = TextEditingController();
  final TextEditingController _nid = TextEditingController();
  // final TextEditingController _photo = TextEditingController();
  final TextEditingController _address = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //  final TextEditingController _cepController = TextEditingController();

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
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      scrollPadding: EdgeInsets.only(bottom: 40),
                      maxLines: 1,
                      autofocus: true,
                      //  controller: _cepController,

                      controller: _registrationNumber,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(
                          Icons.app_registration, "Registration Number"),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Registration Number";
                        }

                        return null;
                      },
                      onSaved: (name) {},
                      // onSaved: (phone) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      autofocus: true,
                      maxLines: 1,
                      controller: _firstName,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(
                          Icons.assignment_ind, "First Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter first name";
                        }

                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      autofocus: true,
                      maxLines: 1,
                      controller: _lastName,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(
                          Icons.assignment_ind_outlined, "Last Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter last name";
                        }

                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      autofocus: true,
                      maxLines: 1,
                      controller: _userName,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.person, "User Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter last name";
                        }

                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _phone,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(Icons.phone, "Phone"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your phone";
                        }

                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      autofocus: true,
                      maxLines: 1,
                      controller: _gender,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.add, "Gender"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your phone";
                        }

                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _dateOfBirth,
                      autofocus: true,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(
                          Icons.date_range, "Date Of Birth"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Date Of Birth";
                        }

                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      autofocus: true,
                      maxLines: 1,
                      controller: _age,
                      keyboardType: TextInputType.number,
                      decoration:
                          buildInputDecoration(Icons.calendar_today, "Age"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Age";
                        }

                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      autofocus: true,
                      maxLines: 1,
                      controller: _bloodGroup,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.bloodtype, "Blood Group"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Blood Group";
                        }

                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      autofocus: true,
                      maxLines: 1,
                      controller: _nid,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(Icons.person, "NID"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your NID";
                        }

                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      autofocus: true,
                      maxLines: 1,
                      controller: _address,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.add_location, "Address"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Address";
                        }

                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      autofocus: true,
                      maxLines: 1,
                      controller: _password,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.lock, "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Password";
                        }

                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ElevatedButton(
                            child: const Text(
                              'Update',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                            ),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                // ignore: avoid_print
                                //  print(widget.id);
                                // print("hi");

                                Fluttertoast.showToast(
                                    msg: 'Info Has Been Updated',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.teal[900],
                                    textColor: Colors.black);

                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(const SnackBar(
                                //   content: Center(
                                //       child: Text("Info Has Been Updated")),
                                // ));

                                verifyUser();

                                // print("Successful");
                              } else {
                                // ignore: avoid_print
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
    var apiUrl = "http://192.168.0.121:9010/api/docinfoupdate/${widget.id}";

    Map mapeddate = {
      'RegistrationNo': _registrationNumber.text,
      'FirstName': _firstName.text,
      'LastName': _lastName.text,
      'userName': _userName.text,
      'PhoneNumber': _phone.text,
      'Gender': _gender.text,
      'DateOfBirth': _dateOfBirth.text,
      'Age': _age.text,
      'BloodGroup': _bloodGroup.text,
      'NID': _nid.text,
      // 'Photo': _photo.text,
      'Address': _address.text,
      'Password': _password.text,
    };

    var datas = await http.put(Uri.parse(apiUrl), body: mapeddate);

    var status = datas.statusCode;
    // var bod = datas.body;

    // ignore: avoid_print
    // print(bod);
    if (status == 200) {
      // ignore: avoid_print
      print(datas.body);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Person(
                    docNurId: widget.id,
                  )));
    }
  }
}
