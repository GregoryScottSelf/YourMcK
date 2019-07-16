import'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:csi380/SearchService.dart';
import'package:csi380/entryscreen.dart';
import'package:csi380/FriendRequest.dart';
class Search extends StatefulWidget {
  @override
  _Search createState()=>new _Search();
}
class _Search extends State<Search>
{

  var queryResultSet = [];
  var tempSearchStore = [];


  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['First Name'].startsWith(capitalizedValue) || element['Last Name'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       resizeToAvoidBottomPadding: false,
        body:ListView(children: <Widget>[

          Padding(

            padding: const EdgeInsets.all(10.0),
            child: TextField(
              style: new TextStyle(
                  //fontSize: 10.0,
                  height: 2.5,
                  color: Colors.black
              ),
              autofocus: true,

              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(

                  contentPadding: EdgeInsets.only(left: 10.0),
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          ),
          SizedBox(height: 10.0),
          GridView.count(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              primary: false,
              shrinkWrap: true,
              children: tempSearchStore.map((element) {
                return buildResultCard(element);
              }).toList())
        ]));
  }
}

Widget buildResultCard(data) {
void LetsGetThisBread()async {
  Firestore.instance.collection("FriendRequest").document().setData({'RQE':data['email'],'RQN':data["First Name"],'Email':us.email});
  Firestore.instance.collection('Friend').document().setData({"List": ns['RQN'],"Email":us.email,"RQE":ns["RQE"]});


}
  return Center(
     child: Card(

       child: Container(
         child:Column(
             mainAxisSize: MainAxisSize.min,
              children:<Widget>[
                Text(data['First Name'],
                textAlign: TextAlign.center,

                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,

                ),
              ),
              ButtonTheme.bar(
                child:ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('Send Request'),
                      onPressed: (

                          ) {LetsGetThisBread();},
                    ),

                  ],
                )
              )
             ]
             )
          )
         )
      );
}