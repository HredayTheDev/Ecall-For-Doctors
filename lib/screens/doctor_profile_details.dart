
import 'package:ecalldoc/models/educational_info.dart';
import 'package:ecalldoc/models/experience_info.dart';
import 'package:ecalldoc/models/personal_info.dart';
import 'package:flutter/material.dart';
class DoctorProfileDetails extends StatefulWidget {

  String id;
  DoctorProfileDetails({required this.id});

  // This widget is the root of your application.
  @override
  _DoctorProfileDetailsState createState() => _DoctorProfileDetailsState();
}

class _DoctorProfileDetailsState extends State<DoctorProfileDetails> with TickerProviderStateMixin {
  late TabController _tabController;
 

  int _currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text(
          "This is Appbar",
          style:
              TextStyle(color: Colors.blue[150], fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.person,
                color: Colors.amber[200],
              ),
              child: Text(
                "Personal Info",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.cast_for_education,
                color: Colors.amber[200],
              ),
              child: Text(
                "Educational Info",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.info,
                color: Colors.amber[200],
              ),
              child: Text(
                "ExperienceInfo",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Personal()),
          Center(child: Education()),
          Center(child: Experience()),
        ],
      ),
    ));
  }
}
