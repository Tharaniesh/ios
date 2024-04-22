
//6. Flutter Game

import 'package:flutter/material.dart';

void main() {
runApp(GameApp());
}

class GameApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Flutter Game Example',
home: GameScreen(),
);
}
}

class GameScreen extends StatefulWidget {
@override
_GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
with SingleTickerProviderStateMixin {
late AnimationController _controller;
late Animation<Offset> _animation;
double _positionX = 0.0;

@override
void initState() {
super.initState();
_controller = AnimationController(
vsync: this,
duration: Duration(seconds: 1),
);

_animation = Tween<Offset>(
begin: Offset(0, 0),
end: Offset(1, 0),).animate(_controller);

_controller.repeat(reverse: true);
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Flutter Game'),
),
body: GestureDetector(
onHorizontalDragUpdate: (details) {
setState(() {
_positionX += details.primaryDelta!;
});
},
child: Stack(
children: [
Positioned(
left: _positionX,
top: 200,
child: SlideTransition(
position: _animation,
child: GameCharacter(),
),
),
],
),
),
);
}

@override
void dispose() {
_controller.dispose();
super.dispose();
}
}

class GameCharacter extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Container(
width: 50,
height: 50,
decoration: BoxDecoration(
color: Colors.blue,
shape: BoxShape.circle,
),
);
}
}

