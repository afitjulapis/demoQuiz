import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Providing with ChangeNotifier{
  var soalanSenang=[];
  Future<void> setSoalan(String temp) async {
    print('setting soalan');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('soalan', temp.toString());
  }
  Future<void> getSoalan() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tempStirng = (prefs.getString('soalan')) ;
      if(tempStirng==null||tempStirng.length==0){
        soalanSenang=[];
      }else{
        soalanSenang=json.decode(tempStirng);
      }
      
      // print('Your list  $userFSP');
  }
  var soalanMedium=[];
  Future<void> setSoalanSederhana(String temp) async {
    print('setting soalan');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('soalanM', temp.toString());
  }
  Future<void> getSoalanSederhana() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tempStirng = (prefs.getString('soalanM')) ;
      if(tempStirng==null||tempStirng.length==0){
        soalanMedium=[];
      }else{
        soalanMedium=json.decode(tempStirng);
      }
      
      // print('Your list  $userFSP');
  }
  var soalanSukar=[];
  Future<void> setSoalanSukar(String temp) async {
    print('setting soalan');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('soalanS', temp.toString());
  }
  Future<void> getSoalanSukar() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tempStirng = (prefs.getString('soalanS')) ;
      if(tempStirng==null||tempStirng.length==0){
        soalanSukar=[];
      }else{
        soalanSukar=json.decode(tempStirng);
      }
      
      // print('Your list  $userFSP');
  }
  var isItFirstTime;
  Future<void> setFirstTimeCheck(bool temp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first', temp);
  }
  Future<void> getFirstTimeCheck() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool tempBoool = (prefs.getBool('first')) ;
      if(tempBoool==null){
        isItFirstTime=true;
      }else{
        isItFirstTime=tempBoool;
      }
      // print('Your list  $userFSP');
  }
  var topScore=[];
  Future<void> setTopSCore(String temp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Topscore', temp.toString());
  }
  Future<void> getTopScore() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tempStirng = (prefs.getString('Topscore')) ;
      if(tempStirng==null||tempStirng.length==0){
        topScore=[0,0,0];
      }else{
        topScore=json.decode(tempStirng);
      }
      
      // print('Your list  $userFSP');
  }
  var scoreList=[];
  Future<void> setSCoreList(String temp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('SLez', temp.toString());
  }
  Future getScoreList() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tempStirng = (prefs.getString('SLez')) ;
      if(tempStirng==null||tempStirng.length==0){
        scoreList=[];
        // scoreList=[['asd',90]];
      }else{
        scoreList=json.decode(tempStirng);
      }
      return scoreList;
      // print('Your list  $userFSP');
  }
  var scoreListMedum=[];
  Future<void> setSCoreListMED(String temp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('SLMedium', temp.toString());
  }
  Future getScoreListMED() async {
    print('getting');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tempStirng = (prefs.getString('SLMedium')) ;
      if(tempStirng==null||tempStirng.length==0){
        scoreList=[];
        // scoreListMedum=[['med',90],['med',90]];
      }else{
        scoreListMedum=json.decode(tempStirng);
      }
      return scoreListMedum;
      // print('Your list  $userFSP');
  }
  var scoreListHard=[];
  Future<void> setSCoreListHARD(String temp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('SLHard', temp.toString());
  }
  Future getScoreListHARD() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tempStirng = (prefs.getString('SLHard')) ;
      if(tempStirng==null||tempStirng.length==0){
        scoreList=[];
        // scoreListHard=[['hard',90],['hard',90],['hard',90]];
      }else{
        scoreListHard=json.decode(tempStirng);
      }
      return scoreListHard;
      // print('Your list  $userFSP');
  }

  List soalanMudah= 
    [
      {
        'question':'✔️ 💖',
        'answer':0,
        'option':['Ada hati','Betul cinta','Benar hati']
      },
      {
        'question':'🌊 😉',
        'answer':2,
        'option':['Ombak kenyit','Gelombang senyum','Air muka']
      },
      {
        'question':'🩸🥩',
        'answer':2,
        'option':['Daging merah','Merah daging','Darah daging']
      },
      
    ];
  List<int> recordedAnswer=List<int>();

  List soalanSedang= 
    [
      {
        'question':'🏋️👀',
        'answer':1,
        'option':['Angkat pandangan','Berat mata','Kudrat memandang']
      },
      {
        'question':'🍇👐',
        'answer':2,
        'option':['Anggur diberi','Buah terbuka','Buah tangan']
      },
      {
        'question':'📚✋',
        'answer':0,
        'option':['Buku lima','Ilmu diterima','Buku ditangan']
      }
      
    ];
  List<int> recordedAnswerMed=List<int>();

  List soalanSusah= 
    [
      {
        'question':' 😎💖',
        'answer':'buta hati',
      },
      {
        'question':'✔️🌊 ✔️🐟',
        'answer':'ada air ada ikan',
      },
      
    ];
  List<String> recordedAnswerSusah=List<String>();

  int scoreForMudah;
  int scoreForMedium;
  int scoreForSusah;

  var iAmFrom='';
  var editFrom='';


}