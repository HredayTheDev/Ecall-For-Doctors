import 'dart:convert';
import 'dart:async';



import 'package:ecalldoc/screens/doctor_chamber_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
    required this.chamberInfo,
  });

  List<ChamberInfo> chamberInfo;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        chamberInfo: List<ChamberInfo>.from(
            json["chamberInfo"].map((x) => ChamberInfo.fromJson(x))),
      );
}

class ChamberInfo {
  ChamberInfo({
    required this.id,
    // required this.docNurId,
    required this.institutionName,
    // required this.location,
    // required this.startTime,
    // required this.endTime,
    // required this.day,
    // required this.isActive
  });

  int id;
  // String docNurId;
  String institutionName;
  // String location;

  // String startTime;
  // String endTime;
  // String day;
  // bool isActive;

  factory ChamberInfo.fromJson(Map<String, dynamic> json) => ChamberInfo(
        id: json["ID"],
        // docNurId: json["DocNurID"],
        institutionName: json["InstitutionName"],
        // location: json["Location"],
        // startTime: json["Start_time"],
        // endTime: json["End_time"],
        // day: json["Day"],
        // isActive: json["IsActive"],
      );
}

class Chamber extends StatefulWidget {
  String id;
  Chamber({required this.id});

  @override
  _ChamberState createState() => _ChamberState();
}

class _ChamberState extends State<Chamber> {
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
                            itemCount: snapshot.data!.chamberInfo.length,
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
                                                            .chamberInfo[index]
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
                                          // Expanded(
                                          //   flex: 2,
                                          //   child: Column(
                                          //     children:  [
                                          //       const Expanded(
                                          //           flex: 1,
                                          //           child: Text("Location",
                                          //               style:  TextStyle(
                                          //   color: Colors.white,
                                          //   fontWeight: FontWeight.bold,
                                          //   fontSize: 12))),
                                          //       Expanded(
                                          //           flex: 1,
                                          //           child: Text(snapshot
                                          //                   .data!
                                          //                   .chamberInfo[index]
                                          //                   .location,
                                          //               style:  const TextStyle(
                                          //   color: Colors.white,
                                          //   fontWeight: FontWeight.bold,
                                          //   fontSize: 10))),
                                          //     ],
                                          //   ),
                                          // ),
                                          // Expanded(
                                          //   flex: 2,
                                          //   child: Column(
                                          //     children:  [
                                          //       const Expanded(
                                          //           flex: 1,
                                          //           child: Text(
                                          //             "StartTime",
                                          //             style:  TextStyle(
                                          //   color: Colors.white,
                                          //   fontWeight: FontWeight.bold,
                                          //   fontSize: 12),
                                          //           )),
                                          //       Expanded(
                                          //           flex: 1,
                                          //           child: Text(snapshot
                                          //                   .data!
                                          //                   .chamberInfo[index]
                                          //                   .startTime,
                                          //               style:  const TextStyle(
                                          //   color: Colors.white,
                                          //   fontWeight: FontWeight.bold,
                                          //   fontSize: 10
                                          //               ))),
                                          //     ],
                                          //   ),
                                          // ),
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
                                'Update Chamber Info',
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
                                            DoctorChamberInfoUpdate(
                                              id: widget.id,
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
        Uri.parse('http://192.168.0.121:9010/api/singledoctor/${widget.id}'));

    if (response.statusCode == 200) {
      var doclist = UserModel.fromJson(jsonDecode(response.body));

      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
