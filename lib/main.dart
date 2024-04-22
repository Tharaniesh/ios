
1. Story Board

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

2. UserAction And Smiley

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



3. Conditonally Smiley

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


4. CELSIUS TO FAHRENHEIT

import 'package:flutter/material.dart';

void main() {
runApp( MyApp());
}

class MyApp extends StatefulWidget{
@override
State<StatefulWidget> createState() => MyHome();


}
class MyHome extends State<MyApp>{
var val;
var out="";
@override
Widget build(BuildContext context) {
return MaterialApp(
home: Scaffold(
appBar: AppBar(title: Text("CELSIUS TO  FAHRENHEIT"),),
body: Center(
child:Column(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
TextFormField(keyboardType: TextInputType.number,
decoration: InputDecoration(labelText: "ENTER THE CELSIUS"),
onChanged: (value)=>val=value,),
ElevatedButton(onPressed:(){
setState(() {
var vl=double.parse(val);
vl*=1.8;
vl+=32;
out=vl.toString();
});
} , child: Text("Change")),
Text(out+" .Fahrenheit"),

],
),
),
),

);
}
some(){
out=val;
}

}

5. PASSING MESSAGE

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



6. Flutter Game

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



7. Address Book

import 'package:flutter/material.dart';

void main() {
runApp(AddressBookApp());
}

class Contact {
final String name;
final String phoneNumber;
final String email;

Contact({required this.name, required this.phoneNumber, required this.email});
}

class AddressBookApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Address Book',
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: AddressBookHomePage(),
);
}
}

class AddressBookHomePage extends StatefulWidget {
@override
_AddressBookHomePageState createState() => _AddressBookHomePageState();
}

class _AddressBookHomePageState extends State<AddressBookHomePage> {
final List<Contact> contacts = [];

TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController emailController = TextEditingController();

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.purple[100],
appBar: AppBar(
backgroundColor: Colors.blueGrey[200],
title: Text('Address Book'),
),
body: ListView.builder(
itemCount: contacts.length,
itemBuilder: (BuildContext context, int index) {
return ListTile(
title: Text(contacts[index].name),
subtitle: Text(contacts[index].phoneNumber),
onTap: () {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: Text('Contact Details'),
content: Column(
crossAxisAlignment: CrossAxisAlignment.start,
mainAxisSize: MainAxisSize.min,
children: [
Text('Name: ${contacts[index].name}'),
Text('Phone Number: ${contacts[index].phoneNumber}'),
Text('Email: ${contacts[index].email}'),
],
),
actions: [
TextButton(
onPressed: () {
Navigator.of(context).pop();
},
child: Text('Close'),
),
],
);
},
);
},
);
},
),
floatingActionButton: SizedBox(
width: 150.0, // Adjust the width as needed
height: 50.0, // Adjust the height as needed
child: FloatingActionButton(
onPressed: () {
_showAddContactDialog(context);
},
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text('Add Your Details'),
Icon(Icons.add),
],
),
),
),
);
}

void _showAddContactDialog(BuildContext context) {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: Text('Add Contact'),
content: Column(
mainAxisSize: MainAxisSize.min,
children: [
TextField(
controller: nameController,
decoration: InputDecoration(labelText: 'Name'),
),
TextField(
controller: phoneNumberController,
decoration: InputDecoration(labelText: 'Phone Number'),
),
TextField(
controller: emailController,
decoration: InputDecoration(labelText: 'Email'),
),
],
),
actions: [
TextButton(
onPressed: () {
Navigator.of(context).pop();
},
child: Text('Cancel'),
),
TextButton(
onPressed: () {
setState(() {
contacts.add(Contact(
name: nameController.text,
phoneNumber: phoneNumberController.text,
email: emailController.text,
));
nameController.clear();
phoneNumberController.clear();
emailController.clear();
});
Navigator.of(context).pop();
},
child: Text('Add'),
),
],
);
},
);
}
}


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



11. Image Picker

YAML FILE
name: program7
description: "A new Flutter project."
# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
sdk: '>=3.2.3 <4.0.0'

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
flutter:
sdk: flutter


# The following adds the Cupertino Icons font to your application.
# Use with the CupertinoIcons class for iOS style icons.
cupertino_icons: ^1.0.2
image_picker: ^1.0.7

dev_dependencies:
flutter_test:
sdk: flutter

# The "flutter_lints" package below contains a set of recommended lints to
# encourage good coding practices. The lint set provided by the package is
# activated in the `analysis_options.yaml` file located at the root of your
# package. See that file for information about deactivating specific lint
# rules and activating additional ones.
flutter_lints: ^2.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

# The following line ensures that the Material Icons font is
# included with your application, so that you can use the icons in
# the material Icons class.
uses-material-design: true

# To add assets to your application, add an assets section, like this:
# assets:
#   - images/a_dot_burr.jpeg
#   - images/a_dot_ham.jpeg

# An image asset can refer to one or more resolution-specific "variants", see
# https://flutter.dev/assets-and-images/#resolution-aware

# For details regarding adding assets from package dependencies, see
# https://flutter.dev/assets-and-images/#from-packages

# To add custom fonts to your application, add a fonts section here,
# in this "flutter" section. Each entry in this list should have a
# "family" key with the font family name, and a "fonts" key with a
# list giving the asset and other descriptors for the font. For
# example:
# fonts:
#   - family: Schyler
#     fonts:
#       - asset: fonts/Schyler-Regular.ttf
#       - asset: fonts/Schyler-Italic.ttf
#         style: italic
#   - family: Trajan Pro
#     fonts:
#       - asset: fonts/TrajanPro.ttf
#       - asset: fonts/TrajanPro_Bold.ttf
#         weight: 700
#
# For details regarding fonts from package dependencies,
# see https://flutter.dev/custom-fonts/#from-packages


MAIN DART

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Image Picker Demo',
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: ImagePickerPage(),
);
}
}

class ImagePickerPage extends StatelessWidget {
final ImagePicker _picker = ImagePicker();

Future<void> _getImage(BuildContext context, ImageSource source) async {
final pickedFile = await _picker.pickImage(source: source);

if (pickedFile != null) {
Navigator.of(context).push(
MaterialPageRoute(
builder: (context) => ImagePreview(imageFile: File(pickedFile.path)),
),
);
} else {
print('No image selected.');
}
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Image Picker Demo'),
),
body: Center(
child: Text('No image selected.'),
),
floatingActionButton: Column(
mainAxisAlignment: MainAxisAlignment.end,
children: <Widget>[
FloatingActionButton(
onPressed: () {
_getImage(context, ImageSource.camera);
},
tooltip: 'Take Photo',
child: Icon(Icons.add_a_photo),
),
SizedBox(height: 16),
FloatingActionButton(
onPressed: () {
_getImage(context, ImageSource.gallery);
},
tooltip: 'Choose from Gallery',
child: Icon(Icons.photo_library),
),
],
),
);
}
}

class ImagePreview extends StatelessWidget {
final File imageFile;

const ImagePreview({required this.imageFile});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Image Preview'),
),
body: Center(
child: Image.file(imageFile),
),
);
}
}


12. WEB ACCESS

MAIN DART

import 'package:flutter/material.dart';
import 'apiService.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Web Access Example',
home: WebAccessDemo(),
);
}
}

class WebAccessDemo extends StatefulWidget {
@override
_WebAccessDemoState createState() => _WebAccessDemoState();
}

class _WebAccessDemoState extends State<WebAccessDemo> {
String _responseData = '';
ApiService _apiService = ApiService(); // Create an instance of ApiService

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Web Access Example'),
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
ElevatedButton(
onPressed: () {
fetchData();
},
child: Text('Fetch Data'),
),
SizedBox(height: 20),
Text(
'Response Data:',
style: TextStyle(fontSize: 18),
),
SizedBox(height: 10),
Expanded(
child: SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.all(8.0),
child: Text(
_responseData,
textAlign: TextAlign.center,
),
),
),
),
],
),
),
);
}

Future<void> fetchData() async {
try {
final response = await _apiService.fetchData();
setState(() {
_responseData = response;
});
} catch (e) {
print('Error fetching data: $e');
}
}
}


YAML FILE

name: webserverprogram
description: "A new Flutter project."
# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
sdk: '>=3.2.3 <4.0.0'

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
flutter:
sdk: flutter
http: ^0.13.3


# The following adds the Cupertino Icons font to your application.
# Use with the CupertinoIcons class for iOS style icons.
cupertino_icons: ^1.0.2

dev_dependencies:
flutter_test:
sdk: flutter

# The "flutter_lints" package below contains a set of recommended lints to
# encourage good coding practices. The lint set provided by the package is
# activated in the `analysis_options.yaml` file located at the root of your
# package. See that file for information about deactivating specific lint
# rules and activating additional ones.
flutter_lints: ^2.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

# The following line ensures that the Material Icons font is
# included with your application, so that you can use the icons in
# the material Icons class.
uses-material-design: true

# To add assets to your application, add an assets section, like this:
# assets:
#   - images/a_dot_burr.jpeg
#   - images/a_dot_ham.jpeg

# An image asset can refer to one or more resolution-specific "variants", see
# https://flutter.dev/assets-and-images/#resolution-aware

# For details regarding adding assets from package dependencies, see
# https://flutter.dev/assets-and-images/#from-packages

# To add custom fonts to your application, add a fonts section here,
# in this "flutter" section. Each entry in this list should have a
# "family" key with the font family name, and a "fonts" key with a
# list giving the asset and other descriptors for the font. For
# example:
# fonts:
#   - family: Schyler
#     fonts:
#       - asset: fonts/Schyler-Regular.ttf
#       - asset: fonts/Schyler-Italic.ttf
#         style: italic
#   - family: Trajan Pro
#     fonts:
#       - asset: fonts/TrajanPro.ttf
#       - asset: fonts/TrajanPro_Bold.ttf
#         weight: 700
#
# For details regarding fonts from package dependencies,
# see https://flutter.dev/custom-fonts/#from-packages


apiSERVICE DART

import 'package:http/http.dart' as http; // Import the http package

import 'dart:convert';

class ApiService {
Future<String> fetchData() async {
final response = await http.get(
Uri.parse('https://jsonplaceholder.typicode.com//posts/1/comments'));

if (response.statusCode == 200) {
final data = json.decode(response.body);
return data.toString();
} else {
throw Exception('Failed to load data');
}
}
}

IOSPROGRAMSEXCEPT10.txt
Displaying IOSPROGRAMSEXCEPT10.txt.