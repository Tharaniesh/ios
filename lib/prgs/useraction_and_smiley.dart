
//2. UserAction And Smiley

MAIN DART


import 'package:flutter/material.dart';
void main(){
runApp(program2());
}

class program2 extends StatelessWidget {
const program2({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return MaterialApp(
home: MyHomePage(),
);
}
}
class MyHomePage extends StatefulWidget {
const MyHomePage({Key? key}) : super(key: key);

@override
State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
String responseMessage = "Hello! How are you?";
String emoji="😍";
void respondToUserAction(){
setState(() {
responseMessage="Great! Keep smiling!";
emoji="😀";
});
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('User Actions and Smiles'),
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Text(
responseMessage,
style: TextStyle(fontSize: 18.0),
textAlign: TextAlign.center,
),
Container(
height:20,
),
Text(
emoji,
style: TextStyle(fontSize: 40.0),
),
Container(
height: 20,
),
ElevatedButton(
onPressed: respondToUserAction,
child: Text('Click Me!'),
),
],
),
),
);
}
}

--------------------------------------
//new dart file
WIDGET TEST

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:program2/main.dart';

void main() {
testWidgets('Counter increments smoke test', (WidgetTester tester) async {
// Build our app and trigger a frame.
await tester.pumpWidget(const program2());

// Verify that our counter starts at 0.
expect(find.text('0'), findsOneWidget);
expect(find.text('1'), findsNothing);

// Tap the '+' icon and trigger a frame.
await tester.tap(find.byIcon(Icons.add));
await tester.pump();

// Verify that our counter has incremented.
expect(find.text('0'), findsNothing);
expect(find.text('1'), findsOneWidget);
});
}


