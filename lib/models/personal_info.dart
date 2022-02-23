import 'dart:convert';
import 'dart:async';

import 'package:ecalldoc/screens/doctor_personal_info_update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
    required this.personalInfo,
  });

  List<PersonalInfo> personalInfo;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        personalInfo: List<PersonalInfo>.from(
            json["personalInfo"].map((x) => PersonalInfo.fromJson(x))),
      );
}

class PersonalInfo {
  PersonalInfo({
    // required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.phoneNumber,
    // required this.docNurId,
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
    // required this.about,
  });

  // int id;
  String firstName;
  String lastName;
  String userName;
  String phoneNumber;
  // String docNurId;
  String gender;
  String dateOfBirth;
  String age;
  String bloodGroup;
  String nid;
  String photo;
  String password;

  String registrationNo;
  String department;
  var primaryAddress;
  // dynamic about;

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        // id: json["ID"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        userName: json["userName"],
        phoneNumber: json["PhoneNumber"],
        // docNurId: json["DocNurID"],
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
        // about: json["about"],
      );
}

class Person extends StatefulWidget {
  String docNurId;
  Person({required this.docNurId});

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
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
                    const CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/portrait-smiling-handsome-male-doctor-man_171337-5055.jpg?size=626&ext=jpg'),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.personalInfo.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Center(
                              child: Text(
                                "${snapshot.data!.personalInfo[index].firstName} ${snapshot.data!.personalInfo[index].lastName}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          );
                        }),

                  

                     Column(
                      children: [
                        ListView.builder(
                            itemCount: snapshot.data!.personalInfo.length,
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
                                                    child: Text("Registration No",
                                                         style:  TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        snapshot
                                                            .data!
                                                            .personalInfo[index]
                                                            .registrationNo,
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
                                                    child: Text("Username",
                                                        style:  TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(snapshot
                                                            .data!
                                                            .personalInfo[index]
                                                            .userName,
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
                                                      "Gender",
                                                      style:  TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(snapshot
                                                            .data!
                                                            .personalInfo[index]
                                                            .gender,
                                                        style:  const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10
                                                        ))),
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
                            })
                      ],
                    ),


                     Column(
                      children: [
                        ListView.builder(
                            itemCount: snapshot.data!.personalInfo.length,
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
                                                    child: Text("Date Of Birth",
                                                       style:  TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        snapshot
                                                            .data!
                                                            .personalInfo[index]
                                                            .dateOfBirth,
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
                                                    child: Text("Age",
                                                       style:   TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(snapshot.data!.personalInfo[index].age,
                                                       style:   const TextStyle(
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
                                                      "Blood Group",
                                                      style:   TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(snapshot.data!.personalInfo[index].bloodGroup,
                                                       style:   const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10
                                                        ))),
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
                            })
                      ],
                    ),

                     Column(
                      children: [
                        ListView.builder(
                            itemCount: snapshot.data!.personalInfo.length,
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
                                                    child: Text("NID",
                                                       style:   TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        snapshot
                                                            .data!
                                                            .personalInfo[index]
                                                            .nid,
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
                                                    child: Text("Address",
                                                       style:   TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(snapshot.data!.personalInfo[index].primaryAddress,
                                                        style:   const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10))),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children:   [
                                                const Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "Password",
                                                      style:   TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(snapshot.data!.personalInfo[index].password,
                                                       style:   const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10
                                                        ))),
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
                            })
                      ],
                    ),


                   
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: ElevatedButton(
                              child: const Text(
                                'Update Personal Info',
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
                                            DoctorPersonalInfoUpdate(
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
