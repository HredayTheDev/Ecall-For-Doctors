// ignore_for_file: prefer_collection_literals

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:ecalldoc/widget/design.dart';

class Prescriptions extends StatefulWidget {
  String patientName;
  String date;
  String time;
  String doctorName;
  String patientPhone;
  String docNurId;
  String patientId;

  Prescriptions(
      {Key? key,
      required this.patientName,
      required this.date,
      required this.time,
      required this.doctorName,
      required this.patientPhone,
      required this.docNurId,
      required this.patientId})
      : super(key: key);

  @override
  _PrescriptionsState createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {
  final TextEditingController _patientName = TextEditingController();

  final TextEditingController _patientGender = TextEditingController();
  final TextEditingController _patientAge = TextEditingController();
  final TextEditingController _patientMob = TextEditingController();
  final TextEditingController _patientSymtomps = TextEditingController();
  final TextEditingController _doctorName = TextEditingController();
  final TextEditingController _doctorMob = TextEditingController();
  final TextEditingController _medicineName = TextEditingController();
  final TextEditingController _medicineTime = TextEditingController();
  final TextEditingController _medicineDays = TextEditingController();
  final TextEditingController _testName = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  List<String> MedicineName = [];
  // ignore: non_constant_identifier_names
  List<String> MedicineTime = [];
  // ignore: non_constant_identifier_names
  List<String> MedicineDays = [];
  // ignore: non_constant_identifier_names
  List<String> TestName = [];

  @override
  void initState() {
    super.initState();
    _patientName.text = widget.patientName;

    _patientMob.text = widget.patientPhone;
    _doctorName.text = widget.doctorName;
  }

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
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: const Text(
            'Prescriptions',
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
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _patientName,
                        keyboardType: TextInputType.text,
                        decoration:
                            buildInputDecoration(Icons.person, "Patient Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your PatientName";
                          }
                          return null;
                        },
                        onSaved: (name) {},
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
                      controller: _patientGender,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.female, "Patient Gender"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Patient Gender";
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: TextFormField(
                      controller: _patientAge,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.date_range, "Patient Age"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Patient Age";
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _patientMob,
                        keyboardType: TextInputType.number,
                        decoration:
                            buildInputDecoration(Icons.phone, "Patient Mob"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Patient Mob";
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: TextFormField(
                      controller: _patientSymtomps,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.sync, "Patient Symtomps"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Patient Symtomps";
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _doctorName,
                        keyboardType: TextInputType.text,
                        decoration:
                            buildInputDecoration(Icons.person, "Doctor Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Doctor Name";
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: TextFormField(
                      controller: _doctorMob,
                      keyboardType: TextInputType.number,
                      decoration:
                          buildInputDecoration(Icons.phone, "Doctor Mob"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Doctor Mob";
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: TextFormField(
                      controller: _medicineName,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(
                          Icons.medication_outlined, "Medicine Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Medicine Name";
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: TextFormField(
                      controller: _medicineTime,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(
                          Icons.date_range_outlined, "Medicine Time"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Medicine Time";
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: TextFormField(
                      controller: _medicineDays,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(
                          Icons.date_range_sharp, "Medicine Days"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Medicine Days";
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 18, right: 18),
                    child: TextFormField(
                      controller: _testName,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.text_snippet, "Test Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Test Name";
                        }

                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ElevatedButton(
                            child: const Text(
                              'Prescribe',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                            ),
                            onPressed: () {
                              //                   Navigator.push(
                              // context, MaterialPageRoute(builder: (context) => DoctorProfileCard(id:"")));
                              // print(widget.patientId);
                              // print(widget.docNurId);

                              if (_formkey.currentState!.validate()) {
                                registrationUser();

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

  Future registrationUser() async {
    MedicineName.add(_medicineName.text);
    MedicineTime.add(_medicineTime.text);
    MedicineDays.add(_medicineDays.text);
    TestName.add(_testName.text);

    var apiUrl = "http://192.168.0.121:9010/api/makeprescription";

    Map mapeddate = {
      'DocNurID': widget.docNurId,
      'PatientID': widget.patientId,
      'PatientName': _patientName.text,
      'PatientGender': _patientGender.text,
      'PatientAge': _patientAge.text,
      'PatientMob': _patientMob.text,
      'PatientSymtomps': _patientSymtomps.text,
      'DoctorName': _doctorName.text,
      'DoctorMob': _doctorMob.text,
      'MedicineName': MedicineName.toString(),
      'MedicineTime': MedicineTime.toString(),
      'MedicineDays': MedicineDays.toString(),
      'TestName': TestName.toString(),
    };

    var datas = await http.post(Uri.parse(apiUrl), body: mapeddate);

    var status = datas.statusCode;
    var bod = datas.body;

    print(bod);
    if (status == 200) {
      print("successfullllllllllol");
      print(bod);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => otpVerify()));
    }
  }
}
