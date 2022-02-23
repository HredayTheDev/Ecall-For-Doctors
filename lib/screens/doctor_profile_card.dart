import 'package:ecalldoc/screens/all_patient_list.dart';
import 'package:ecalldoc/screens/doctor_profile_details.dart';
import 'package:flutter/material.dart';

class DoctorProfileCard extends StatefulWidget {
  String docNurId;

  DoctorProfileCard({Key? key, required this.docNurId}) : super(key: key);
  @override
  State<DoctorProfileCard> createState() => _DoctorProfileCardState();
}

class _DoctorProfileCardState extends State<DoctorProfileCard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.teal[900],
            centerTitle: true,
            title: const Text("Doctor Profile Card"),
          ),
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: AspectRatio(
                            aspectRatio: 3.5 / 4.3,
                            child: Container(
                              color: Color.fromARGB(250, 20, 20, 260),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Card(
                                      color: Colors.white,
                                      child: IconButton(
                                          iconSize: 50,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DoctorProfileDetails(
                                                          docNurId: widget.docNurId,
                                                        )));
                                          },
                                          icon: Icon(Icons.add)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DoctorProfileDetails(
                                                        docNurId: widget.docNurId,
                                                      )));
                                        },
                                        child: const Text(
                                          "Doctor Profile",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: AspectRatio(
                            aspectRatio: 3.5 / 4.3,
                            child: Container(
                              color: Color.fromARGB(250, 50, 30, 60),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Card(
                                      color: Colors.white,
                                      child: IconButton(
                                          iconSize: 50,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PatientListScreen(
                                                          doctorId: widget.docNurId,
                                                        )));
                                          },
                                          icon: Icon(Icons.list)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PatientListScreen(
                                                        doctorId: widget.docNurId,
                                                      )));
                                        },
                                        child: const Text(
                                          "Patient Lists",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
