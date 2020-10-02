import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class Mudah extends StatefulWidget {
  @override
  _MudahState createState() => _MudahState();
}

class _MudahState extends State<Mudah> {
  Map a= 
    {
      0:{
          'question':'Bi 😆 😅 ?',
          'answer':0,
          'option':['Biol','Gila','Tidak Pasti']
          
          
        },
      1:{
          'question':' Ibarat 👹 👺',
          'answer':2,
          'option':['Ibarat musang bermuka','Ibarat kaki dimuka','Ibarat muka macam kaki']
          
          
        },
      2:{
          'question':'Muka 🤡 💩',
          'answer':1,
          'option':['Muka ditimpa tahi','Muka badutahi','Muka buku?']
          
          
        }
      
    };
  List<int> recordedAnswer=List<int>();
  int correctans;
  int selectedIndex;
  int servicesIndex;
  int answeredquestions;
  PageController controller;
  
  

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var progBar=(w*0.8)*(correctans/a.length);
    return Scaffold(
      backgroundColor:Color(0xFFf5f5f6),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Opacity(
                opacity: 0.5,
                child: Image.asset('assets/bgMenu2.png')),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(height: h*0.1,),
              Text('Peratusan betul:',style:TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color:Colors.grey[500])),
              SizedBox(height: h*0.01 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: w*0.1,),
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          height: h*0.06,
                          width: progBar,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.purple,Colors.pink])
                          ),
                          
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          height: h*0.06,
                          width: w*.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            border: Border.all(color: Colors.grey[300],width: 3),
                          ),
                          
                        ),
                      ),
                      Container(
                        width: w*0.8,
                        height: h*0.06,
                        child: Center(
                          child: Stack(
                              children: <Widget>[
                                Text(((correctans/a.length)*100).round().toString()+'%',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:progBar>w*0.4? Colors.white:Colors.grey[800])),
                                
                              ],
                            ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: h*0.05,),
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
                          Text('Question '+(selectedIndex+1).toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Colors.white)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('out of '+a.length.toString(),style:TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color:Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              

              Expanded(
                child: PageView(
                  controller: controller,
                  children: addedAttendeesList(),
                  onPageChanged: onPageChanged,
                ),
              ),
              SizedBox(height: h*0.05,),

            ],
          ),
        ],
      ),
    );
  }


  addedAttendeesList() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    
    
    List<Widget> listwidget = [];
    

    for(int  i = 0; i < a.length; i++){
      if(recordedAnswer.length<i+1){
          recordedAnswer.add(99);
          print(recordedAnswer);
      }
      listwidget.add(
        Container(
          color: Colors.transparent,
          height: h,
          width: w,
          child: Column(
            children: <Widget>[
              SizedBox(height: h*0.07,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(a[i]['question'],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Colors.grey[600])),
                ],
              ),
              SizedBox(height: h*0.07,),

              //ANSWER NUMBER 0
              InkWell(
                onTap: (){

                 setState(() {
                    if(recordedAnswer[i]==99){
                      recordedAnswer[i]=0;
                      print(recordedAnswer);
                      if(a[i]['answer']==recordedAnswer[i]){
                        ++correctans;

                      }
                    }
                  });
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
                          border: Border.all(color:recordedAnswer[i]==0? recordedAnswer[i]==a[i]['answer']?Colors.green:Colors.red:Colors.grey[300],width: 3),
                        ),
                        
                      ),
                    ),
                    Container(
                      width: w*0.8,
                      height: h*0.1,
                      child: Center(
                        child: Stack(
                            children: <Widget>[
                              Text(a[i]['option'][0],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.red)),
                            ],
                          ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: h*0.02,),

              //ANSWER NUMBER 1
              InkWell(
                onTap: (){
                  setState(() {
                    if(recordedAnswer[i]==99){
                      recordedAnswer[i]=1;
                      print(recordedAnswer);
                      if(a[i]['answer']==recordedAnswer[i]){
                        ++correctans;

                      }
                    }
                  });
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
                          border: Border.all(color:recordedAnswer[i]==1? recordedAnswer[i]==a[i]['answer']?Colors.green:Colors.red:Colors.grey[300],width: 3),
                        ),
                        
                      ),
                    ),
                    Container(
                      width: w*0.8,
                      height: h*0.1,
                      child: Center(
                        child: Stack(
                            children: <Widget>[
                              Text(a[i]['option'][1],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.red)),
                            ],
                          ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: h*0.02,),

              //ANSWER NUMBER 2
              InkWell(
                onTap: (){
                  setState(() {
                    if(recordedAnswer[i]==99){
                      recordedAnswer[i]=2;
                      print(recordedAnswer);
                      if(a[i]['answer']==recordedAnswer[i]){
                        ++correctans;

                      }
                    }
                  });
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
                          border: Border.all(color:recordedAnswer[i]==2? recordedAnswer[i]==a[i]['answer']?Colors.green:Colors.red:Colors.grey[300],width: 3),
                        ),
                        
                      ),
                    ),
                    Container(
                      width: w*0.8,
                      height: h*0.1,
                      child: Center(
                        child:  Text(a[i]['option'][2],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.red)),
                           
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: h*0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  i==0?Container():ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: InkWell(
                      onTap: (){
                        controller.previousPage(duration: Duration(milliseconds:200 ), curve: Curves.bounceIn);
                      },
                      child: Container(
                        width: w*0.3,
                        height: h*0.05,
                        color: Colors.lightBlue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('Kembali',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color:Colors.white)),
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                  i==0||i+1==a.length?Container():SizedBox(width: w*0.2,),
                  i+1==a.length?Container(): ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: InkWell(
                      onTap: (){
                        controller.nextPage(duration: Duration(milliseconds:200 ), curve: Curves.bounceIn);
                      },
                      child: Container(
                        width: w*0.3,
                        height: h*0.05,
                        color: Colors.lightBlue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('Seterusnya ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color:Colors.white)),
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              
            ],
          )
        )
      );
    }

    return listwidget;
  }
}