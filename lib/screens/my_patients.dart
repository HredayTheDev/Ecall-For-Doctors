import 'package:ecalldoc/screens/prescriptions.dart';
import 'package:flutter/material.dart';

class MyPatients extends StatefulWidget {
  String patientName, date, time, doctorName, patientPhone, docNurId, patientId;

  MyPatients(
      {required this.patientName,
      required this.date,
      required this.time,
      required this.doctorName,
      required this.patientPhone,
   
      required this.docNurId,
      required this.patientId});

  @override
  _MyPatientsState createState() => _MyPatientsState();
}

class _MyPatientsState extends State<MyPatients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           backgroundColor: Colors.teal[900],
          title: const Text("My Patients"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(2),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView(
              children: [
                Expanded(
                  flex: 9,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            widget.patientName,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            widget.date,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            widget.time,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 2,),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            child: const Text(
                              'Prescribe',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Prescriptions(
                                            patientName: widget.patientName,
                                            date: widget.date,
                                            time: widget.time,
                                            doctorName: widget.doctorName,
                                            docNurId: widget.docNurId,
                                            patientId: widget.patientId,
                                            patientPhone: widget.patientPhone,
                                         
                                          )));
                        
                                          
                                 style: ElevatedButton.styleFrom(
                                primary: Colors.teal[900],
                                fixedSize: const Size(40, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)));
                                },
                               
                        
                              ),
                        )
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
