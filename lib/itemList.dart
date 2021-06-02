import 'package:flutter/material.dart';

class SearchHistoryController extends ChangeNotifier{
int itemIndex;

  List dummySearchHistory=[
    "Chicken Chowmein",
    "Pan fried Chicken fillet",
    "Hydrabari Chicken Biryani",
    "Chicken Pizza",
    "Chicken Pulao",
    "Chicken Sizzler",
    "Chicken Jhir",

  ];



  addItem(String value){
    dummySearchHistory.insert(0, value);
    notifyListeners();
  }

  deleteItem(int index){
    dummySearchHistory.removeAt(index);
    notifyListeners();
  }

  List itemValue=[
    ['Chicken Chowmein', "assets/foods/chickenchowmin.jpg"],
    ['Pan fried Chicken fillet', "assets/foods/chickenfillet.jpg"],
    ['Hydrabari Chicken Biryani', 'assets/foods/chickenbriyani.jpg'],
    ['Chicken Pizza', "assets/foods/chickenpizza.jpg"],
    ['Chicken Pulao',"assets/foods/chickenpollow.jpg"],
    ["Chicken Sizzler", "assets/foods/chickensizzler.jpg"],
    ['Chicken Jhir','assets/foods/chickenjhir.png'],
    ['Chicken Momo','assets/foods/chickenmomo.jpg']
  ];





  checkList(String value){
    for(int i=0;i<=itemValue.length-1;i++)
      if(itemValue[i][0]==value){
        print(itemValue[i][1]);
        return itemValue[i][1];
      }
  }


}


