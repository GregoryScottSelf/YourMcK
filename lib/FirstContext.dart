import'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
class FirstContext extends StatefulWidget {
  @override
  _FirstContext createState() => _FirstContext ();

}
class _FirstContext extends State<FirstContext> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: new StreamBuilder(
          stream: Firestore.instance.collection("Event").where("GroupName",isEqualTo:"UPE").snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData)
              return new Text("Rendering...");
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index){
                  DocumentSnapshot ds=snapshot.data.documents[index];
                  return buildResultCard(ds);
                }
            );
          },
        ),


    );

  }



}
Widget buildResultCard(ds) {

  return Center(
      child: Card(

          child: Container(
              child:Column(
                 mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    Text(ds['GroupName']+" just posted!"+"\n"+ds['EventTitle']+"\n"+ds['Where']+" @ "+ds['Time'],
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,

                      ),
                    ),
                    ButtonTheme.bar(

                        child:ButtonBar(
                            mainAxisSize: MainAxisSize.max,
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(

                              child: const Text('Maybe'),

                              onPressed:(){},

                            ),
                            Icon(
                                Icons.not_listed_location,


                            ),
                            FlatButton(

                              child: const Text("Skip"),
                              onPressed:(){},
                            ),
                            Icon(Icons.clear),

                            FlatButton(
                              child:  Text("Going"),
                              onPressed: (){},
                            ),
                            Icon(Icons.check_box),


                          ],
                        )
                    )
                  ]
              )
          )
      )
  );

}