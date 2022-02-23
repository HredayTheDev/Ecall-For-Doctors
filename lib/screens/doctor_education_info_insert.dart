//import 'package:ecalldoc/screens/doctor_personal_info.dart';
import 'package:ecalldoc/models/educational_info.dart';

import 'package:flutter/material.dart';

import 'package:ecalldoc/widget/design.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class DoctorEducationalInfoInsert extends StatefulWidget {
  var id;

  DoctorEducationalInfoInsert({Key? key, required this.id}) : super(key: key);

  @override
  _DoctorEducationalInfoInsertState createState() =>
      _DoctorEducationalInfoInsertState();
}

class _DoctorEducationalInfoInsertState
    extends State<DoctorEducationalInfoInsert> {
  // final TextEditingController _docNurID = TextEditingController();
  final TextEditingController _institutionName = TextEditingController();
  final TextEditingController _degree = TextEditingController();
  final TextEditingController _startDate = TextEditingController();

  final TextEditingController _endDate = TextEditingController();
  // final TextEditingController _isActive = TextEditingController();

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
                      controller: _institutionName,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(
                          Icons.assignment_ind, "InstitutionName"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Institution Name";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _degree,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(
                          Icons.assignment_ind_outlined, "Degree"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Degree";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _startDate,
                      keyboardType: TextInputType.number,
                      decoration:
                          buildInputDecoration(Icons.person, "Start Date"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Start Date";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: TextFormField(
                      controller: _endDate,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(Icons.phone, "End Date"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your phone";
                        }

                        return null;
                      },
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
                                print(widget.id);
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
    var apiUrl = "http://192.168.0.121:9010/api/educationinsert/${widget.id}";

    Map mapeddate = {
      // 'DocNurID': _docNurID.text,
      'institutionName': _institutionName.text,
      'degree': _degree.text,
      'start_date': _startDate.text,
      'end_date': _endDate.text,
      // 'IsActive': _isActive.text,
    };

    var datas = await http.post(Uri.parse(apiUrl), body: mapeddate);

    var status = datas.statusCode;
    // var bod = datas.body;

    // ignore: avoid_print
    // print(bod);
    if (status == 200) {
      // ignore: avoid_print
      // print(datas.body);
     
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Education(
                    docNurId: widget.id,
                  )));
    } else {
      print("error");
    }
  }
}
