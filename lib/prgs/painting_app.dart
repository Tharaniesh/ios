

8. PAINTING APP

import 'package:flutter/material.dart';

void main() {
runApp(PaintingApp());
}

class PaintingApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Painting App',
home: PaintingScreen(),
);
}
}

class PaintingScreen extends StatefulWidget {
@override
_PaintingScreenState createState() => _PaintingScreenState();
}

class _PaintingScreenState extends State<PaintingScreen> {
List<Offset> points = [];

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Painting App'),
),
body: GestureDetector(
onPanUpdate: (details) {
setState(() {
RenderBox renderBox = context.findRenderObject() as RenderBox;
points.add(renderBox.globalToLocal(details.globalPosition));
});
},
onPanEnd: (details) {
points
    .add(Null as Offset); // Add null to separate consecutive strokes
},
child: CustomPaint(
painter: PaintingPainter(points),
size: Size.infinite,
),
),
floatingActionButton: FloatingActionButton(
onPressed: () {
setState(() {
points.clear();
});
},
child: Icon(Icons.clear),
),
);
}
}

class PaintingPainter extends CustomPainter {
final List<Offset?> points;

PaintingPainter(this.points);

@override
void paint(Canvas canvas, Size size) {
Paint paint = Paint()
..color = Colors.black
..strokeCap = StrokeCap.round
..strokeWidth = 5.0;

for (int i = 0; i < points.length - 1; i++) {
if (points[i] != null && points[i + 1] != null) {
canvas.drawLine(points[i]!, points[i + 1]!, paint);
}
}
}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}
