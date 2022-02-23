import 'package:ecalldoc/screens/doctor_profile_card.dart';
import 'package:ecalldoc/screens/my_patients.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

class PatientList {
  final List<Patients> patients;

  PatientList({
    required this.patients,
  });

  factory PatientList.fromJson(List<dynamic> parsedJson) {
    List<Patients> patients = [];
    patients = parsedJson.map((i) => Patients.fromJson(i)).toList();

    return PatientList(patients: patients);
  }
}

class Patients {
  final String firstName;
  final String lastName;
  final String bookingDate;
  int appointmentId;
  final String bookingTime;
  final String docNurId;
  final String patientId;
  final String phone;
  final String doctorName;

  Patients({
    required this.firstName,
    required this.lastName,
    required this.appointmentId,
    required this.bookingDate,
    required this.bookingTime,
    required this.docNurId,
    required this.patientId,
    required this.phone,
    required this.doctorName,
  });

  factory Patients.fromJson(Map<String, dynamic> json) {
    return Patients(
      firstName: json['FirstName'],
      lastName: json['LastName'],
      appointmentId: json['appointmentID'],
      bookingDate: json['BookingDate'],
      bookingTime: json['BookingTime'],
      docNurId: json['DocNurID'],
      patientId: json['PatientID'],
      phone: json['Phone'],
      doctorName: json['DoctorName'],
    );
  }
}

// void main() {
//   runApp(const PatientListScreen());
// }

class PatientListScreen extends StatefulWidget {
  final String doctorId;

  PatientListScreen({
    required this.doctorId,
  });

  @override
  _PatientListScreenState createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  late String codeDialog;
  late String valueText;

  TextEditingController _textFieldController = TextEditingController();
  late Future<PatientList> futureAlbum;

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Why do you want to reject? Tell the reason'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration:
                  InputDecoration(hintText: "Write Probable Reason Here"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('SUBMIT'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.brown.shade100,
        appBar: AppBar(
           backgroundColor: Colors.teal[900],
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
          title: const Text('Patient Request'),
        ),
        body: Center(
          child: FutureBuilder<PatientList>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.patients.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = snapshot.data!.patients[index];
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            color: Colors.white,
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                //  mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceEvenly,

                                      children: [
                                        const Text(
                                          "Patient Name:",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceEvenly,

                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${snapshot.data!.patients[index].firstName} ${snapshot.data!.patients[index].lastName}",
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                    color: Colors.deepPurple,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          "Booking Date:",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text( 
                                                snapshot.data!.patients[index]
                                                    .bookingDate,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                    color: Colors.deepPurple,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          "Booking Time:",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                snapshot.data!.patients[index]
                                                         .bookingTime,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                    color: Colors.deepPurple,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],  
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FlatButton(
                                         color: Color.fromARGB(250, 50, 30, 60),
                                          textColor: Colors.white,
                                          onPressed: () async {
                                            var appointmentIds = snapshot.data!
                                                .patients[index].appointmentId;
                                              var apiUrl =
                                                "http://192.168.0.121:9010/api/appointmentstatusupdate/${appointmentIds}/accepted";
                                            var datas = await http.put(
                                              Uri.parse(apiUrl),
                                            );
                                            var status = datas.statusCode;
                                            if (status == 200) {
                                              print('success');
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => MyPatients(
                                                          patientName:
                                                              '${snapshot.data!.patients[index].firstName} ${snapshot.data!.patients[index].lastName}',
                                                          date: snapshot
                                                              .data!
                                                              .patients[index]
                                                              .bookingDate,
                                                          patientPhone: snapshot
                                                              .data!
                                                              .patients[index]
                                                              .phone,
                                                          doctorName: snapshot
                                                              .data!
                                                              .patients[index]
                                                              .doctorName,
                                                          docNurId: snapshot
                                                              .data!
                                                              .patients[index]
                                                              .docNurId,
                                                          patientId: snapshot
                                                              .data!
                                                              .patients[index]
                                                              .patientId,
                                                          time: snapshot
                                                              .data!
                                                              .patients[index]
                                                              .bookingTime)));
                                            }
                                          },
                                          child: const Text(
                                            "Accept",
                                            style: TextStyle(
                                                //  color: Colors.green,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      FlatButton(
                                          color: Colors.teal[900],
                                          textColor: Colors.white,
                                          onPressed: () async {
                                            var appointmentIds = snapshot.data!
                                                .patients[index].appointmentId;
                                            var apiUrl =
                                                "http://192.168.0.121:9010/api/appointmentstatusupdate/${appointmentIds}/waiting";
                                            var datas = await http.put(
                                              Uri.parse(apiUrl),
                                            );
                                            var status = datas.statusCode;
                                            if (status == 200) {
                                              print('success');
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DoctorProfileCard(
                                                            docNurId: widget.doctorId,
                                                          )));
                                            }
                                          },
                                          child: const Text(
                                            "Wait",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      RaisedButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          onPressed: () {
                                            _displayTextInputDialog(context);
                                          },
                                          child: const Text(
                                            "Reject",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {}

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future<PatientList> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'http://192.168.0.121:9010/api/getappoinmentlistbydoc/${widget.doctorId}'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var doclist = PatientList.fromJson(jsonDecode(response.body));

      return PatientList.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
