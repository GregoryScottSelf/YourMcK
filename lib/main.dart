/*
  Main
  Todo:
    *Navigate to 'EntryPage'-done
    *Theme color-done

 */
import 'package:csi380/entryscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: EntryPage(),
    );
  }
}

