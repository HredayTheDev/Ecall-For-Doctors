import 'dart:convert';
import 'dart:async';

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
class Personal extends StatefulWidget {
  // String id;
  // SingleDoc({required this.id});
  

  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
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
                                SizedBox(height: 25,),



  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          child: const Text(
                            'Update Personal Info',
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
                                  borderRadius: BorderRadius.circular(50))),
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
        .get(Uri.parse('http://192.168.0.121:9010/api/singledoctor/DC5634137'));

    if (response.statusCode == 200) {
      var doclist = UserModel.fromJson(jsonDecode(response.body));

      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  
 
  

 

 
  

 
  


  
}
