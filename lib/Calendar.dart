import 'package:flutter/material.dart';
import'package:folding_cell/folding_cell.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              child:SimpleFoldingCell(
                  frontWidget: Front(),
                  innerTopWidget: InnerT(),
                  innerBottomWidget: InnerB(),
                //device dependent screen
                cellSize: Size(MediaQuery.of(context).size.width,175),
                //side padding
                padding:EdgeInsets.all(10.0),
              )
            ),

          ],
        )
      ),

    );
  }
}
//return type container of Front child
//Front side of calendar displays date and event title
Container Front() {
  return Container(
    //TODO can add color here
    alignment: Alignment.center,
      child:Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            decoration:BoxDecoration(
              color: Colors.deepPurple,

            ),
              child:Container(
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                  Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: <Widget>[

                      Container(
                        child:Padding(
                            padding: const EdgeInsets.all(8.0),
                          child: Text('Today',

                                  style: TextStyle(
                                    color:Colors.white,
                                    fontSize: 20.0,

                                  ),
                              ),

                        )

                      ),
                      Container(
                        child:Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                          children: <Widget>[
                           Column(
                               mainAxisAlignment:MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('9:00 AM',

                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 20.0,

                              ),
                            ),

                          )
                            ),
                               ],
                          ),
                            ],
                       )
                      )

                    ],
                  )


                   ],
                ),

              )
          ),


        ),
        Expanded(
          flex: 2,
          child: Container(
              decoration:new BoxDecoration(

                color: Colors.blueGrey,
              ),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Pizza Party",
                    style:TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),


                    ),
                  ),
                  Container(
                    child:Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child:Padding(padding:const EdgeInsets.all(8.0),
                          child:Icon(

                                  FontAwesomeIcons.mapMarkerAlt,
                                  color:Colors.amber,
                                  size:20.0,

                                ),
                            ),

                        ),

                      Container(
                        child:Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: <Widget>[
                        Container(
                        child: Padding(padding: const EdgeInsets.all(8.0),
                        child:Text("Hett",
                            style: TextStyle(
                              color:Colors.white,
                              fontSize:16,
                              fontWeight: FontWeight.bold,


                               ),


                            )

                             ),
                        ),
                          ],
                          ),

                      ),

                      ],
                    )
                  )
                ],

              )
          ),



        )

        ],
      ),

  );

}
Container InnerB(){
  return Container(
    color:Colors.deepPurple ,
    alignment: Alignment.center,
    child: Container(


      child:Column(
        children: <Widget>[

          Container(
            child: Padding(padding:const EdgeInsets.all(8.0),
            child: Text("Details",
              style:TextStyle(
                color:Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,


              ),
            ),


            ),
          ),

          Container(
            child: Padding(padding: const EdgeInsets.all(8.0),
                child:Text("9:00 AM-11:00 AM",
                  style: TextStyle(
                    color:Colors.white,
                    fontSize:16,
                    fontWeight: FontWeight.bold,


                  ),


                )

            ),

          ),

          Container(
            child: Padding(padding: const EdgeInsets.all(8.0),
                child:Text("In the Band Room",
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,


                  ),


                )

            ),

          ),

        ],


      )
    ),

  );
}
Container InnerT(){
  return Container(
    color:Colors.blueGrey,

    alignment: Alignment.center,
    child: Container(


        child:Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[

            Container(
              child: Padding(padding:const EdgeInsets.all(8.0),
                child: Text("UPE",
                  style:TextStyle(
                    color:Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,


                  ),
                ),


              ),
            ),

          ],


        )
    ),

  );

}



