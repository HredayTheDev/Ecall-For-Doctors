import 'dart:convert';
import 'dart:async';

import 'package:ecalldoc/screens/doctor_education_info_insert.dart';
import 'package:ecalldoc/screens/doctor_educational_info_update.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
    required this.educationInfo,
  });

  List<EducationInfo> educationInfo;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        educationInfo: List<EducationInfo>.from(
            json["educationInfo"].map((x) => EducationInfo.fromJson(x))),
      );
}

class EducationInfo {
  EducationInfo({
    // required this.id,
    // required this.docNurId,
    required this.institutionName,
    required this.degree,
    required this.startDate,
    required this.endDate,
    required this.dataId,
    // required this.isActive
  });

  // int id;
  // String docNurId;
  String institutionName;
  String degree;

  String startDate;
  String endDate;
  int dataId;

  // bool isActive;

  factory EducationInfo.fromJson(Map<String, dynamic> json) => EducationInfo(
        // id: json["ID"],
        // docNurId: json["DocNurID"],
        institutionName: json["InstitutionName"],
        degree: json["Degree"],
        startDate: json["Start_date"],
        endDate: json["End_date"],
        dataId: json["ID"],
        // isActive: json["IsActive"],
      );
}

class Education extends StatefulWidget {
  String docNurId;
  Education({required this.docNurId});

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  late Future<UserModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: FutureBuilder<UserModel>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(children: [
                    ListView.builder(
                        itemCount: snapshot.data!.educationInfo.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Color.fromARGB(250, 50, 30, 60),
                              elevation: 10,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            const Expanded(
                                                flex: 1,
                                                child: Text("Institute Name",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12))),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                    snapshot
                                                        .data!
                                                        .educationInfo[index]
                                                        .institutionName,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10))),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            const Expanded(
                                                flex: 1,
                                                child: Text("Degree",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12))),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                    snapshot
                                                        .data!
                                                        .educationInfo[index]
                                                        .degree,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10))),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            const Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Year",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                    snapshot
                                                        .data!
                                                        .educationInfo[index]
                                                        .startDate,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10))),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            const Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Update Data",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: IconButton(
                                                  padding: EdgeInsets.only(bottom: 5),
                                                iconSize: 15,
                                                  onPressed: () {
                                                     Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DoctorEducationalInfoUpdate(
                                              docNurId: widget.docNurId,
                                              dataId: snapshot.data!.educationInfo[index].dataId,
                                            )));



                                                    
                                                  },
                                                  icon: const Icon(Icons.edit,color: Colors.white,),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                height: 55,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(250, 50, 30, 60),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: ElevatedButton(
                              child: const Text(
                                'Insert Education Info',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DoctorEducationalInfoInsert(
                                              id: widget.docNurId,
                                            

                                            )));

                                //   print("Successful");
                                // } else {
                                //   print("Unsuccessfull");
                                // }
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
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         width: MediaQuery.of(context).size.width * 0.7,
                    //         child: ElevatedButton(
                    //           child: const Text(
                    //             'Update Educational Info',
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 18),
                    //           ),
                    //           onPressed: () async {
                    //             Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         DoctorEducationalInfoUpdate(
                    //                           id: widget.id,
                    //                         )));

                    //             //   print("Successful");
                    //             // } else {
                    //             //   print("Unsuccessfull");
                    //             // }
                    //           },
                    //           style: ElevatedButton.styleFrom(
                    //               primary: Colors.teal[900],
                    //               fixedSize: const Size(40, 40),
                    //               shape: RoundedRectangleBorder(
                    //                   borderRadius: BorderRadius.circular(50))),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ]);
                }

                if (snapshot.hasData) {
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<UserModel> fetchAlbum() async {
    final response = await http.get(
        Uri.parse('http://192.168.0.121:9010/api/singledoctor/${widget.docNurId}'));

    if (response.statusCode == 200) {
      var doclist = UserModel.fromJson(jsonDecode(response.body));

      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
