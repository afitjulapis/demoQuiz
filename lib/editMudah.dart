import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';
import 'package:somedemo/provider.dart';
import 'package:somedemo/scorepage.dart';

class EditMudah extends StatefulWidget {
  @override
  _EditMudahState createState() => _EditMudahState();
}

class _EditMudahState extends State<EditMudah> {
  
  int correctans;
  int totalAnswerd;
  int selectedIndex;
  int servicesIndex;
  int answeredquestions;
  PageController controller;
  var soalan;
  var pilihan1;
  var pilihan2;
  var pilihan3;
  var jawapan;


  
  

  void onPageChanged(int pagenum) {
    setState(() {
      selectedIndex = pagenum;
      // answeredquestions=(((pagenum+1)/a.length)*100).round();
      // print(answeredquestions);
    });
  }

   @override
  void initState() {
    onPageChanged(0);
    controller = PageController(initialPage: 0);
    correctans=0;
    totalAnswerd=0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var prov = Provider.of<Providing>(context);
    var progBar=(w*0.8)*(correctans/prov.soalanSenang.length);
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor:Color(0xFFf5f5f6),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Opacity(
                    opacity: 0.5,
                    child: Image.asset('assets/bgMenu2.png')),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: h*0.07,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamedAndRemoveUntil(context, '/mainpage', (route)=>false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: w*0.02,),
                        FaIcon(FontAwesomeIcons.home,color: Colors.blue,size: 16,),
                        SizedBox(width: w*0.01,),
                        Text('Menu',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Colors.blue)),
                      ],
                    ),
                  ),
                  SizedBox(height: h*0.08,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Container(
                      width: w*0.45,
                      height: h*0.08,
                      color: Colors.greenAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('Tambah',style:TextStyle(fontWeight: FontWeight.normal,fontSize: 25,color:Colors.white,fontFamily: 'bree')),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('soalan ',style:TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color:Colors.white,fontFamily: 'bree')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: h*0.8,
                    width: w,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: h*0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: w*0.5,
                              child: TextFormField(
                                decoration: InputDecoration(hintText: 'Sila isikan soalan',hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Colors.grey[500])),
                                onChanged: (String text){
                                  setState(() {
                                    soalan=text;
                                  });
                                },
                                textAlign: TextAlign.center,
                                ),
                            ),
                          ],
                        ),
                        SizedBox(height: h*0.07,),

                        //ANSWER NUMBER 0
                        InkWell(
                          onTap: (){

                         
                          },
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(500),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  height: h*0.06,
                                  width: w*0.8,
                                  
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: h*0.1,
                                  width: w*.8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color:Colors.grey[300],width: 3),
                                  ),
                                  
                                ),
                              ),
                              Container(
                                width: w*0.8,
                                height: h*0.1,
                                child: Center(
                                  child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: w*0.5,
                                          child: TextFormField(
                                            decoration: InputDecoration(hintText: 'Sila isikan pilihan 0',hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Colors.grey[500])),
                                            onChanged: (String text){
                                              setState(() {
                                                pilihan1=text;
                                              });
                                            },
                                            textAlign: TextAlign.center,
                                            ),
                                        ),
                                      ],
                                    ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: h*0.02,),

                        //ANSWER NUMBER 1
                        prov.editFrom=='hard'? Container(): InkWell(
                          onTap: (){
                          
                          },
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(500),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  height: h*0.06,
                                  width: w*0.8,
                                  
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: h*0.1,
                                  width: w*.8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color:Colors.grey[300],width: 3),
                                  ),
                                  
                                ),
                              ),
                              Container(
                                width: w*0.8,
                                height: h*0.1,
                                child: Center(
                                  child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: w*0.5,
                                          child: TextFormField(
                                            decoration: InputDecoration(hintText: 'Sila isikan pilihan 1',hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Colors.grey[500])),
                                            onChanged: (String text){
                                              setState(() {
                                                pilihan2=text;
                                              });
                                            },
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: h*0.02,),

                        //ANSWER NUMBER 2
                        prov.editFrom=='hard'? Container(): InkWell(
                          onTap: (){
                          },
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(500),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  height: h*0.06,
                                  width: w*0.8,
                                  
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: h*0.1,
                                  width: w*.8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color:Colors.grey[300],width: 3),
                                  ),
                                  
                                ),
                              ),
                              Container(
                                width: w*0.8,
                                height: h*0.1,
                                child: Center(
                                  child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: w*0.5,
                                          child: TextFormField(
                                            decoration: InputDecoration(hintText: 'Sila isikan pilihan 2',hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Colors.grey[500])),
                                            onChanged: (String text){
                                              setState(() {
                                                pilihan3=text;
                                              });
                                            },
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                        SizedBox(height: h*0.02,),

                        prov.editFrom=='hard'? Container(): InkWell(
                          onTap: (){
                          },
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(500),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  height: h*0.06,
                                  width: w*0.8,
                                  
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: h*0.1,
                                  width: w*.8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color:Colors.grey[300],width: 3),
                                  ),
                                  
                                ),
                              ),
                              Container(
                                width: w*0.8,
                                height: h*0.1,
                                child: Center(
                                  child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: w*0.5,
                                          child: TextFormField(
                                            keyboardType:TextInputType.number ,
                                            decoration: InputDecoration(hintText: 'Sila isikan jawapan (0-2)',hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Colors.grey[500])),
                                            onChanged: (String text){
                                              setState(() {
                                                jawapan=int.parse(text);
                                                if(jawapan>2||jawapan<0){
                                                  jawapan=0;
                                                }
                                              });
                                            },
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                        SizedBox(height: h*0.05,),
                        InkWell(
                          onTap: (){
                            if(prov.editFrom=='ez'){
                              prov.soalanSenang.add({
                                'question':soalan,
                                'answer':jawapan,
                                'option':[pilihan1,pilihan2,pilihan3]
                              },);
                              prov.setSoalan(json.encode(prov.soalanSenang));
                            }else if(prov.editFrom=='med'){
                              prov.soalanMedium.add({
                                'question':soalan,
                                'answer':jawapan,
                                'option':[pilihan1,pilihan2,pilihan3]
                              },);
                              prov.setSoalan(json.encode(prov.soalanMedium));
                            }else if(prov.editFrom=='hard'){
                              prov.soalanSukar.add({
                                'question':soalan,
                                'answer':pilihan1,
                              },);
                              prov.setSoalan(json.encode(prov.soalanSukar));
                            }
                            Navigator.pop(context);
                          },
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: h*0.06,
                                  width: w*.8,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(child: Text('Simpan',style:TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'bree')),),
                                  
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                        
                      ],
                    )
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
//   addedAttendeesList() {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
    
//     var prov = Provider.of<Providing>(context);
//     List<Widget> listwidget = [];
    

//     for(int  i = 0; i < prov.soalanSenang.length; i++){
//       if(prov.recordedAnswer.length<i+1){
//           prov.recordedAnswer.add(99);
//           print(prov.recordedAnswer);
//       }
//       listwidget.add(
        
//       );
//     }

//     return listwidget;
//   }
// }