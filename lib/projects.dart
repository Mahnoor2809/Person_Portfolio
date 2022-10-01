import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  State<MyProjects> createState() => _MyProjectsState();
}
class _MyProjectsState extends State<MyProjects> {

  mypro(lang, title, des,star) {
    return Container (
      width: MediaQuery.of(context).size.width*0.9,
      height: 220,
      child: Card(
        color: Color(0xff262628),
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 10,top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(lang,style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),),
              SizedBox(height: 15),
              Text(title,style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 3),
              Text(des,style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.star,
                    color: Colors.white70,
                    size: 18,),
                  SizedBox(width: 4),
                  Text(star,style: (
                      TextStyle(color: Colors.white70)
                  ),),
                  Expanded(child: Container()),
                  IconButton(onPressed: () => _launchUrl('https://github.com/Shahrukh-cyber'),
                    icon: Icon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                  ),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff252525),
        title: Text('Projects'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              mypro(' JavaScript', 'LinkedIn-Clone', 'LinkedIn-Clone using React Redux', '10'),
              mypro('React', 'CovidTracker', 'Covid-19 Tracker Application', '10'),
              mypro(' JavaScript ', 'MovlixWebapp ', 'Movlix Progressive web app', '10'),
              mypro('Html/CSS', 'quickstart-js ', 'Firebase Quickstart Samples for Web', '10'),
              mypro('JavaScript', 'HealthManagementSys', 'Health-Management-system using firebase', '10'),
              mypro('TypeScript', 'AdvanceRedux ', 'An Online Store', '10'),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl(String urlToLaunch) async {
    if (!await launchUrl(Uri.parse(urlToLaunch)
    )) {
      throw 'Could not launch $urlToLaunch()';
    }
  }
}
