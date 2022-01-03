import 'dart:convert';
import 'dart:async';

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
  ExperienceInfo(
      {required this.id,
      required this.docNurId,
      required this.institutionName,
      required this.designation,
      required this.startDate,
      required this.endDate,
      required this.isActive});

  int id;
  String docNurId;
  String institutionName;
  String designation;

  String startDate;
  String endDate;
  bool isActive;

  factory ExperienceInfo.fromJson(Map<String, dynamic> json) => ExperienceInfo(
        id: json["ID"],
        docNurId: json["DocNurID"],
        institutionName: json["InstitutionName"],
        designation: json["Designation"],
        startDate: json["Start_date"],
        endDate: json["End_date"],
        isActive: json["IsActive"],
      );
}

class Experience extends StatefulWidget {
  // String id;
  // SingleDoc({required this.id});

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
        body: Container(
          child: SingleChildScrollView(
            child: FutureBuilder<UserModel>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                      child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/portrait-smiling-handsome-male-doctor-man_171337-5055.jpg?size=626&ext=jpg'),
                          radius: 90,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          "${snapshot.data!.experienceInfo[0].docNurId} ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                                "${snapshot.data!.experienceInfo[0].institutionName}")),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                                "${snapshot.data!.experienceInfo[0].startDate}")),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                                "${snapshot.data!.experienceInfo[0].endDate}")),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                                "${snapshot.data!.experienceInfo[0].isActive}")),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                                "${snapshot.data!.experienceInfo[0].designation}")),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: ElevatedButton(
                                child: const Text(
                                  'Update Experience Info',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23),
                                ),
                                onPressed: () {
                                  // if (_formkey.currentState!.validate()) {
                                  //   // ignore: avoid_print
                                  //   print(widget.id);
                                  //   verifyUser();

                                  //   // print("Successful");
                                  // } else {
                                  //   // ignore: avoid_print
                                  //   print("Unsuccessfull");
                                  // }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.cyan,
                                    //  fixedSize: const Size(50, 100),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
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
      )),
    );
  }

  Future<UserModel> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('http://192.168.0.121:9010/api/singledoctor/DC9469086'));

    if (response.statusCode == 200) {
      var doclist = UserModel.fromJson(jsonDecode(response.body));

      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
