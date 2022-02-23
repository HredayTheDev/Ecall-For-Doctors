import 'dart:convert';
import 'dart:async';

import 'package:ecalldoc/screens/doctor_experience_info_insert.dart';
import 'package:ecalldoc/screens/doctor_experience_info_update.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
    required this.experienceInfo,
  });

  List<ExperienceInfo> experienceInfo;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        experienceInfo: List<ExperienceInfo>.from(
            json["experienceInfo"].map((x) => ExperienceInfo.fromJson(x))),
      );
}

class ExperienceInfo {
  ExperienceInfo({
    // required this.id,
    required this.institutionName,
    required this.designation,
    required this.startDate,
    required this.endDate,
    required this.dataId,
  });

  int dataId;

  String institutionName;
  String designation;

  String startDate;
  String endDate;

  factory ExperienceInfo.fromJson(Map<String, dynamic> json) => ExperienceInfo(
        dataId: json["ID"],
        institutionName: json["InstitutionName"],
        designation: json["Designation"],
        startDate: json["Start_date"],
        endDate: json["End_date"],
      );
}

class Experience extends StatefulWidget {
  String docNurId;
  Experience({required this.docNurId});

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
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
          body:SingleChildScrollView(
            child: FutureBuilder<UserModel>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      children: [
                        ListView.builder(
                            itemCount: snapshot.data!.experienceInfo.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                   color:  Color.fromARGB(250, 50, 30, 60),
                                 
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
                                                         style:  TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        snapshot
                                                            .data!
                                                            .experienceInfo[index]
                                                            .institutionName,
                                                        textAlign:
                                                            TextAlign.center,
                                                         style:  const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10))),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children:  [
                                                const Expanded(
                                                    flex: 1,
                                                    child: Text("Year",
                                                        style:  TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(snapshot
                                                            .data!
                                                            .experienceInfo[index]
                                                            .startDate,
                                                        style:  const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10))),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children:  [
                                                const Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "Designation",
                                                      style:  TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(snapshot
                                                            .data!
                                                            .experienceInfo[index]
                                                            .designation,
                                                        style:  const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10
                                                        ))),
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
                                            DoctorExperienceInfoUpdate(
                                              docNurId: widget.docNurId,
                                              dataId: snapshot.data!.experienceInfo[index].dataId,
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
                                       color:  Color.fromARGB(250, 50, 30, 60),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
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
                                'Insert Experience Info',
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
                                           DoctorExperienceInfoInsert(
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
