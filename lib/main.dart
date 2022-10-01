
import 'package:flutter/material.dart';
import 'package:flutter_project_2/about.dart';
import 'package:flutter_project_2/home.dart';
import 'package:flutter_project_2/projects.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        fontFamily: "soho"
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home' : (context) =>MyHome(),
      'about' : (context) =>MyAbout(),
      'projects':(context)=>MyProjects()
    },
  ));
}

