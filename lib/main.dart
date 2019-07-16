/*
  Main
  Todo:
    *Navigate to 'EntryPage'-done
    *Theme color-done

 */
import 'package:csi380/entryscreen.dart';
import 'package:flutter/material.dart';
import 'package:csi380/SignUpPage.dart';
import 'package:csi380/HomePage.dart';
import 'package:csi380/Groups.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: EntryPage(),
      routes:<String, WidgetBuilder>{
       // '/EntryPage':(BuildContext context)=> new EntryPage(),
      //  '/SignUpPage':(BuildContext context)=> new SignUpPage(),
        '/HomePage':(BuildContext context)=> new HomePage(),
       '/Groups':(BuildContext context)=>new Groups(),

    },
    );
  }
}

