import 'package:ecalldoc/screens/doctor_personal_info.dart';
import 'package:ecalldoc/screens/doctor_profile_details.dart';

import 'package:flutter/material.dart';

import 'package:ecalldoc/widget/design.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class DoctorProfileUpdate extends StatefulWidget {
  String id;
  DoctorProfileUpdate({Key? key, required this.id}) : super(key: key);

  @override
  _DoctorProfileUpdateState createState() => _DoctorProfileUpdateState();
}

class _DoctorProfileUpdateState extends State<DoctorProfileUpdate> {
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
  final TextEditingController _photo = TextEditingController();
  final TextEditingController _address = TextEditingController();

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
        //backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text(
            'Doctor Profile Update',
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
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _registrationNumber,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(
                          Icons.app_registration,
                          "Registration Number"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Registration Number";
                        }
                      
                        return null;
                      },
                      onSaved: (phone) {},
                    ),
                  ),
                 const SizedBox(height: 15,),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _firstName,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.assignment_ind, "First Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter first name";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _lastName,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.assignment_ind_outlined , "Last Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter last name";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
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
                    ),
                  ),

                  const SizedBox(height: 15,),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _phone,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(Icons.phone, "Phone"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your phone";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _gender,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.add, "Gender"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your phone";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _dateOfBirth,
                         keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(
                          Icons.date_range, "Date Of Birth"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Date Of Birth";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
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
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
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
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _nid,
                         keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(Icons.person, "Nid"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your NID";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _photo,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.add_a_photo, "Photo"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Photo";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _address,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.add_location , "Address"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Address";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _password,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.lock, "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Password";
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
                            'Update',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              // ignore: avoid_print
                              print(widget.id);
                              verifyUser();

                              // print("Successful");
                            } else {
                              // ignore: avoid_print
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
      'Photo': _photo.text,
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
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  DoctorProfileDetails(id: widget.id,)));
    }
  }
}
