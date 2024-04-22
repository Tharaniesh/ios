
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


//new dart file

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
