import 'package:ecalldoc/models/chamber_info.dart';
import 'package:ecalldoc/models/educational_info.dart';
import 'package:ecalldoc/models/experience_info.dart';
import 'package:ecalldoc/models/personal_info.dart';
import 'package:flutter/material.dart';

class DoctorProfileDetails extends StatefulWidget {
  String docNurId;
  DoctorProfileDetails({required this.docNurId});

  // This widget is the root of your application.
  @override
  _DoctorProfileDetailsState createState() => _DoctorProfileDetailsState();
}

class _DoctorProfileDetailsState extends State<DoctorProfileDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;

  int _currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctor Profile",
          style:
              TextStyle(color: Colors.blue[150], fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[900],
        toolbarHeight: 35,
        
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.person,
                color: Colors.amberAccent,
              ),
              child: Text(
                "Personal Info",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.white),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.cast_for_education,
                color: Colors.amberAccent,
              ),
              child: Text(
                "Educational Info",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.white),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.info,
                color: Colors.amberAccent,
              ),
              child: Text(
                "Experience Info",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.white),
              ),
            ),

             Tab(
              icon: Icon(
                Icons.info,
                color: Colors.amberAccent,
              ),
              child: Text(
                "Chembar Info",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Person(
              docNurId: widget.docNurId,
            ),
          ),
          Education(
            docNurId: widget.docNurId,
          ),
          Experience(
            docNurId: widget.docNurId,
          ),
            Chamber(
            id: widget.docNurId,
          ),
        ],
      ),
    ));
  }
}
