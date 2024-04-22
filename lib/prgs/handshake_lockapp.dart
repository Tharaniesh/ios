9. LOCKSCREEN

import 'package:flutter/material.dart';

void main() {
runApp(HandshakeLockApp());
}

class HandshakeLockApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Handshake Lock',
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: HandshakeLockScreen(),
);
}
}

class HandshakeLockScreen extends StatefulWidget {
@override
_HandshakeLockScreenState createState() => _HandshakeLockScreenState();
}

class _HandshakeLockScreenState extends State<HandshakeLockScreen> {
bool _locked = true;

void _toggleLock() {
setState(() {
_locked = !_locked;
});
}

void _showUnlockDialog() {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: Text('Unlock Handshake'),
content: Text('Enter the secret handshake to unlock.'),
actions: <Widget>[
TextButton(
onPressed: () {
Navigator.of(context).pop();
},
child: Text('Cancel'),
),
TextButton(
onPressed: () {
_toggleLock();
Navigator.of(context).pop();
},
child: Text('Unlock'),
),
],
);
},
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Handshake Lock'),
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Text(
_locked ? 'Locked' : 'Unlocked',
style: TextStyle(fontSize: 24.0),
),
SizedBox(height: 20.0),
ElevatedButton(
onPressed: _locked ? _showUnlockDialog : _toggleLock,
child: Text(_locked ? 'Unlock' : 'Lock'),
),
],
),
),
);
}
}
