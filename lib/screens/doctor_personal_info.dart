import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
    required this.personalInfo,
    required this.educationInfo,
    required this.experienceInfo,
    required this.chamberData,
    required this.feesData,
  });

  List<PersonalInfo> personalInfo;
  List<EducationInfo> educationInfo;
  List<ExperienceInfo> experienceInfo;
  List<ChamberInfo> chamberData;
  List<FeesInfo> feesData;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        personalInfo: List<PersonalInfo>.from(
            json["personalInfo"].map((x) => PersonalInfo.fromJson(x))),
        educationInfo: List<EducationInfo>.from(
            json["educationInfo"].map((x) => EducationInfo.fromJson(x))),
        experienceInfo: List<ExperienceInfo>.from(
            json["experienceInfo"].map((x) => ExperienceInfo.fromJson(x))),
        chamberData: List<ChamberInfo>.from(
            json["chamberData"].map((x) => ChamberInfo.fromJson(x))),
        feesData: List<FeesInfo>.from(
            json["feesData"].map((x) => FeesInfo.fromJson(x))),
      );
}

class ChamberInfo {
  ChamberInfo(
      {required this.id,
      required this.docNurId,
      required this.institute,
      required this.location,
      required this.startTime,
      required this.endTime,
      required this.day,
      required this.isActive});

  int id;
  String docNurId;
  String institute;
  String location;

  String startTime;
  String endTime;
  String day;
  bool isActive;

  factory ChamberInfo.fromJson(Map<String, dynamic> json) => ChamberInfo(
        id: json["ID"],
        docNurId: json["DocNurID"],
        institute: json["InstitutionName"],
        location: json["Location"],
        startTime: json["Start_time"],
        endTime: json["End_time"],
        day: json["Day"],
        isActive: json["IsActive"],
      );
}

class FeesInfo {
  FeesInfo({
    required this.docNurId,
    required this.homeprice,
    required this.onlineprice,
  });

  String docNurId;
  String homeprice;
  String onlineprice;

  factory FeesInfo.fromJson(Map<String, dynamic> json) => FeesInfo(
        // id: json["ID"],
        docNurId: json["DocNurID"],
        homeprice: json["Home"],
        onlineprice: json["Online"],
      );
}

class EducationInfo {
  EducationInfo(
      {required this.id,
      required this.docNurId,
      required this.institutionName,
      required this.degree,
      required this.startDate,
      required this.endDate,
      required this.isActive});

  int id;
  String docNurId;
  String institutionName;
  String degree;

  String startDate;
  String endDate;
  bool isActive;

  factory EducationInfo.fromJson(Map<String, dynamic> json) => EducationInfo(
        id: json["ID"],
        docNurId: json["DocNurID"],
        institutionName: json["InstitutionName"],
        degree: json["Degree"],
        startDate: json["Start_date"],
        endDate: json["End_date"],
        isActive: json["IsActive"],
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

class PersonalInfo {
  PersonalInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.phoneNumber,
    required this.docNurId,
    required this.gender,
    required this.dateOfBirth,
    required this.age,
    required this.bloodGroup,
    required this.nid,
    required this.photo,
    required this.password,
    required this.registrationNo,
    required this.department,
    required this.primaryAddress,
    required this.about,
  });

  int id;
  String firstName;
  String lastName;
  String userName;
  String phoneNumber;
  String docNurId;
  String gender;
  String dateOfBirth;
  String age;
  String bloodGroup;
  String nid;
  String photo;
  String password;

  String registrationNo;
  String department;
  String primaryAddress;
  dynamic about;

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        id: json["ID"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        userName: json["userName"],
        phoneNumber: json["PhoneNumber"],
        docNurId: json["DocNurID"],
        gender: json["Gender"],
        dateOfBirth: json["DateOfBirth"],
        age: json["Age"],
        bloodGroup: json["BloodGroup"],
        nid: json["NID"],
        photo: json["Photo"],
        password: json["Password"],
        registrationNo: json["RegistrationNo"],
        department: json["Department"],
        primaryAddress: json["PrimaryAddress"],
        about: json["about"],
      );
}

// void main() => runApp(SingleDoc(
//       docnurID: "123",
//       depName: "Medicine",
//       patientID: "1234",
//       pFirstName: "Hreday",
//       pLastName: "Sagar",
//       pPhone: "01937734362",
//       pPhoto: "photo",
//     ));

class SingleDoc extends StatefulWidget {
  String id;
  SingleDoc({required this.id});
  
  // String docnurID;
  // String patientID;
  // String depName;
  // String pFirstName;
  // String pLastName;
  // String pPhone;
  // String pPhoto;
  // SingleDoc(
  //     {required this.docnurID,
  //     required this.depName,
  //     required this.patientID,
  //     required this.pFirstName,
  //     required this.pLastName,
  //     required this.pPhone,
  //     required this.pPhoto});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SingleDoc> {
  late Future<UserModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                          height: 15,
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
                          "${snapshot.data!.personalInfo[0].firstName} ${snapshot.data!.personalInfo[0].lastName}",
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
                                "${snapshot.data!.personalInfo[0].userName}")),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                                "${snapshot.data!.personalInfo[0].phoneNumber}")),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                                "${snapshot.data!.personalInfo[0].gender}")),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                                "${snapshot.data!.personalInfo[0].dateOfBirth}")),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child:
                                Text("${snapshot.data!.personalInfo[0].age}")),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child:
                                Text("${snapshot.data!.personalInfo[0].nid}")),
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
        .get(Uri.parse('http://192.168.0.121:9010/api/singledoctor/${widget.id}'));

    if (response.statusCode == 200) {
      var doclist = UserModel.fromJson(jsonDecode(response.body));

      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

 
  
}
