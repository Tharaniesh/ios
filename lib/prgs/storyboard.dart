// 1. Story Board
import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

// This widget is the root of your application.
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Flutter Demo',
debugShowCheckedModeBanner: false
,
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: Scaffold(
appBar: AppBar(title: Text("STORY BOARD"),),
body: Center(
child: Container(
color: Colors.green,
width: 300,
height: 600,
child: Text("HI YOU SUCCESSFULLY CREATED YOUR FIRST FLUTTER PROJECT,FLUTTER IS AN AWESOME FRAME FOR CROSS PLATFORM DEVELOPMENT",),
),
),

),
);
}
}
