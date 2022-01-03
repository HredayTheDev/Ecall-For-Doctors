import 'dart:convert';
import 'dart:async';

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
class Education extends StatefulWidget {
  // String id;
  // SingleDoc({required this.id});
  

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
                          "${snapshot.data!.educationInfo[0].docNurId} ",
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
                                "${snapshot.data!.educationInfo[0].institutionName}")),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                                "${snapshot.data!.educationInfo[0].degree}")),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                                "${snapshot.data!.educationInfo[0].startDate}")),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                                "${snapshot.data!.educationInfo[0].endDate}")),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child:
                                Text("${snapshot.data!.educationInfo[0].isActive}")),
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
                            'Update Educational Info',
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
        .get(Uri.parse('http://192.168.0.121:9010/api/singledoctor/DC9469086'));

    if (response.statusCode == 200) {
      var doclist = UserModel.fromJson(jsonDecode(response.body));

      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  
 
  

 

 
  

 
  


  
}
