
//4. CELSIUS TO FAHRENHEIT

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
