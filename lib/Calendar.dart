import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'dooboolab flutter calendar',
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Calendar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDate = DateTime(2018, 8, 1);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel(
        //  onDayPressed: (DateTime date) {
           // this.setState(() => _currentDate = date);
         // },
          weekendTextStyle: TextStyle(
            color: Colors.red,
          ),
          thisMonthDayBorderColor: Colors.grey,
       //  weekDays: null, /// for pass null when you do not want to render weekDays
       //  headerText: Container( /// Example for rendering custom header
        //   child: Text('Custom Header'),
        // ),
          height: 420.0,
          selectedDateTime: _currentDate,
          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}