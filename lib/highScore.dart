import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:somedemo/demoMenu.dart';
import 'package:somedemo/mudah.dart';
import 'package:somedemo/provider.dart';
import 'package:somedemo/sederhana.dart';
import 'package:somedemo/sukar.dart';

class HighScore extends StatefulWidget {
  @override
  _HighScoreState createState() => _HighScoreState();
}

class _HighScoreState extends State<HighScore> with TickerProviderStateMixin {
  
  var page=0;
  

  @override
  void initState() {
    super.initState();

    // _controller.
  }
  @override
  void dispose(){

    super.dispose();
  }

  Widget buildScoreItem(BuildContext context,int index){
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var prov = Provider.of<Providing>(context);
    var data;
    if(page==0){
      data=prov.scoreList;
    }else if(page==1){
      data=prov.scoreListMedum;
    }else if(page==2){
      data=prov.scoreListHard;
    }
    return data.length==0?
    Container(
      height: h*0.65,
      child: Center(
        child:Text("Tiada rekod tersimpan",style: TextStyle(fontSize: 18,fontFamily: 'bree',color:Colors.grey[800]),)
      ),
    ):
    Padding(
      padding: EdgeInsets.fromLTRB(0, h*0.01, 0, h*0.01),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: w*0.5,
          height: h*0.07,
          color:page==0? Colors.green:page==1?Colors.amber:Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FaIcon(FontAwesomeIcons.trophy,color: Colors.white,),
              SizedBox(width: w*0.2,),
              Text(data[index][0],style: TextStyle(fontSize: 18,fontFamily: 'bree',color: Colors.white),),
              SizedBox(width: w*0.2,),
              Text(data[index][1].toString(),style: TextStyle(fontSize: 18,fontFamily: 'bree',color:Colors.white),)

            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var prov = Provider.of<Providing>(context);

    var parser = EmojiParser();

    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor:Color(0xFFf5f5f6),
        body:Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/bgMenu2.png'),
              ],
            ),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: h*0.06,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: w*.9,
                          height: h*0.06,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      page=0;
                                    });
                                  },
                                  child: Container(
                                    color:page==0? Colors.blue:Colors.white,
                                    child: Padding(
                                      padding:  EdgeInsets.all(w*.02),
                                      child: Text("Mudah",style: TextStyle(fontSize: 18,fontFamily: 'bree',color: page==0? Colors.white:Colors.blue),),
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(width: w*0.1,) ,
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      page=1;
                                    });
                                  },
                                  child: Container(
                                    color: page==1? Colors.blue:Colors.white,
                                    child: Padding(
                                      padding:  EdgeInsets.all(w*.02),
                                      child: Text("Sederhana",style: TextStyle(fontSize: 18,fontFamily: 'bree',color: page==1? Colors.white:Colors.blue),),
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(width: w*0.1,) ,
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      page=2;
                                    });
                                  },
                                  child: Container(
                                    color: page==2? Colors.blue:Colors.white,
                                    child: Padding(
                                      padding:  EdgeInsets.all(w*.02),
                                      child: Text("Sukar",style: TextStyle(fontSize: 18,fontFamily: 'bree',color:page==2? Colors.white:Colors.blue),),
                                    )
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: (){
                          },
                          child: Container(
                            height: h*0.7,
                            width: w*0.9,
                            color: Colors.white,
                            child: Stack(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Opacity(
                                          opacity: 0.2,
                                          child: Container(
                                            width: w*0.9,
                                            child: Image.asset('assets/button1.png',fit: BoxFit.fitWidth,))
                                          ),
                                        
                                      ],
                                    ),
                                  ],
                                ),
                                page==0?Padding(
                                  padding:EdgeInsets.fromLTRB(w*0.02, h*0.02, w*0.02, h*0.02),
                                  child: Container(
                                    child: FutureBuilder(
                                      future: prov.getScoreList() ,
                                      builder: (BuildContext context, AsyncSnapshot snapshot){
                                        if(snapshot.hasData){
                                          return Container(
                                            height: h*0.65,
                                            child: ListView.builder(
                                              padding: EdgeInsets.all(0),
                                              itemCount: snapshot.data.length==0? 1:snapshot.data.length,
                                              itemBuilder: buildScoreItem
                                            ),
                                          );
                                        } else {
                                          return Container(child: Center(child: CircularProgressIndicator(),));
                                        }
                                      },
                                    ),
                                  ),
                                ):page==1?Padding(
                                  padding:EdgeInsets.fromLTRB(w*0.02, h*0.02, w*0.02, h*0.02),
                                  child: Container(
                                    child: FutureBuilder(
                                      future: prov.getScoreListMED() ,
                                      builder: (BuildContext context, AsyncSnapshot snapshot){
                                        if(snapshot.hasData){
                                          return Container(
                                            height: h*0.65,
                                            child: ListView.builder(
                                              padding: EdgeInsets.all(0),
                                              itemCount: snapshot.data.length==0? 1:snapshot.data.length,
                                              itemBuilder: buildScoreItem
                                            ),
                                          );
                                        } else {
                                          return Container(child: Center(child: CircularProgressIndicator(),));
                                        }
                                      },
                                    ),
                                  ),
                                ):Padding(
                                  padding:EdgeInsets.fromLTRB(w*0.02, h*0.02, w*0.02, h*0.02),
                                  child: Container(
                                    child: FutureBuilder(
                                      future: prov.getScoreListHARD() ,
                                      builder: (BuildContext context, AsyncSnapshot snapshot){
                                        if(snapshot.hasData){
                                          return Container(
                                            height: h*0.65,
                                            child: ListView.builder(
                                              padding: EdgeInsets.all(0),
                                              itemCount: snapshot.data.length==0? 1:snapshot.data.length,
                                              itemBuilder: buildScoreItem
                                            ),
                                          );
                                        } else {
                                          return Container(child: Center(child: CircularProgressIndicator(),));
                                        }
                                      },
                                    ),
                                  ),
                                )
                                
                              ],
                            )

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: h*0.04,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: h*0.08,
                            width: h*0.08,
                            color: Colors.amber,
                            child: Center(child: FaIcon(FontAwesomeIcons.arrowLeft,color: Colors.grey[800],size: 30,)),
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                )
              ],
            ),
          ],
        ) ,
      ),
    );
  }
}