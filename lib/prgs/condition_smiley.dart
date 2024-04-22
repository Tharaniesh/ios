
//3. Conditonally Smiley

MAIN DART


import 'package:flutter/material.dart';
void main(){
runApp(program3());
}
class program3 extends StatelessWidget {
const program3({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Smiley Decision App',
home: SmileyScreen(),
);
}
}

class SmileyScreen extends StatefulWidget {
const SmileyScreen({Key? key}) : super(key: key);

@override
State<SmileyScreen> createState() => _SmileyScreenState();
}

class _SmileyScreenState extends State<SmileyScreen> {
bool isHappy = true;
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Smiley Decsion App'),
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
'How are you feeling?',
style: TextStyle(fontSize: 20),
),
SizedBox(height: 20),
isHappy
? Image.network(
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjCr8twX3N6rXjVLOcsaApfI8CBsyYAts9iQ&usqp=CAU',
height: 100,
width: 100,
)
    : Image.network(
'https://rukminim2.flixcart.com/image/850/1000/poster/k/d/d/athah-poster-beer-it-makes-you-see-double-and-feel-single-original-imaeabbhrfka7agv.jpeg?q=20',
height: 100,
width: 100,
),
SizedBox(height: 20),
ElevatedButton(
onPressed: (){
setState(() {
isHappy = !isHappy;
});
},
child: Text('Toggle Smiley'),
),
],
),
),
);
}
}

