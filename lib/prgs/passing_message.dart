
//5. PASSING MESSAGE

import 'package:flutter/material.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Flutter Demo',
initialRoute: '/',
routes: {
'/': (context) => HomeScreen(),
'/details': (context) => DetailsScreen(),
},
);
}
}

class HomeScreen extends StatefulWidget {
@override
_HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
TextEditingController _messageController = TextEditingController();

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Home Screen'),
),
body: Padding(
padding: EdgeInsets.all(16.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
TextField(
controller: _messageController,
decoration: InputDecoration(
labelText: 'Enter your message',
),
),
SizedBox(height: 20),
ElevatedButton(
onPressed: () {
String message = _messageController.text;
Navigator.pushNamed(
context,
'/details',
arguments: message,
);
},
child: Text('Send Message'),
),
],
),
),
);
}

@override
void dispose() {
_messageController.dispose();
super.dispose();
}
}

class DetailsScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
final String? receivedMessage =
ModalRoute.of(context)?.settings.arguments as String?;

return Scaffold(
appBar: AppBar(
title: Text('Details Screen'),
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
'Message Received:',
style: TextStyle(fontSize: 20),
),
SizedBox(height: 10),
Text(
receivedMessage ?? 'No message',
style: TextStyle(fontSize: 18),
),
],
),
),
);
}
}
