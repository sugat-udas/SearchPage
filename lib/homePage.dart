import 'package:flutter/material.dart';
import 'package:order_app/itemList.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: SearchBody()),
    );
  }
}

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchBarHead(),
        HistoryBody(),


      ],
    );
  }
}

class SearchBarHead extends StatefulWidget {
  @override
  _SearchBarHeadState createState() => _SearchBarHeadState();
}

class _SearchBarHeadState extends State<SearchBarHead> {
  SearchHistoryController _searchHistoryController;
  final content= TextEditingController();
  String inputContent;

  clearInputText(){
    content.clear();
  }
  @override
  Widget build(BuildContext context) {
    _searchHistoryController=Provider.of<SearchHistoryController>(context);
    return Container(
      padding: EdgeInsets.only(left: 16.0,right: 18.0,),
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            iconSize: 18.0,
            icon: Icon(Icons.arrow_back_ios_sharp,),
            onPressed: (){

            },
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                padding: EdgeInsets.only(left: 8.0),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200],

                      )
                    ],
                    borderRadius: BorderRadius.circular(5.0)
                ),
                width: 310.0,
                height: 28.0,
                child: TextFormField(
                  controller: content,
                  textInputAction: TextInputAction.done,
                  enableSuggestions: true,

                  onFieldSubmitted: (value){
                    for(int i=0;i<=_searchHistoryController.dummySearchHistory.length-1;i++)
                      if(value==_searchHistoryController.dummySearchHistory[i]){
                        _searchHistoryController.deleteItem(i);
                      }


                    _searchHistoryController.addItem(value);
                    showDialog(context: context,
                        builder: (BuildContext context){
                      return AlertDialog(
                        content: Image(

                          image: AssetImage(_searchHistoryController.checkList(value)
                            ,),),
                      );
                        }
                    );
                  },
                  onChanged: (value){
                    inputContent=value;



                  },

                  decoration: InputDecoration(
                      border: InputBorder.none,
                    //contentPadding: EdgeInsets.only(left: 8.0)
                  ),
                ),
              ),



              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(
                      Icons.close_rounded,
                    size: 16.0,
                  ),
                ),
                onTap: (){
                  print("Pressed");
                  clearInputText();
                },
              ),


            ],
          ),
        ],
      ),

    );
  }
}

class HistoryBody extends StatelessWidget {
  SearchHistoryController _searchHistoryController;
  @override
  Widget build(BuildContext context) {
    _searchHistoryController=Provider.of<SearchHistoryController>(context);
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
          itemCount: _searchHistoryController.dummySearchHistory.length,

          itemBuilder: (BuildContext context, int index){
            return Column(
              children: [
                ListTile(
                  tileColor: Colors.white,
                  title: _historyBody(_searchHistoryController.dummySearchHistory[index]),
                      trailing: GestureDetector(
                          child: Image.asset("assets/Group 878.png",),
                        onTap: (){
                            _searchHistoryController.deleteItem(index);
                        },
                      ),
                ),

                Divider(
                  color: Colors.grey[200],
                  height: 2.0,
                )
              ],
            );
          }
      ),
    );

  }

  Widget _historyBody(String item){
    List finalName=[];
    //var flenght=item.split(' ').length;
    //print(flenght);
    //int index=item.indexOf("Chicken");
    List fname=item.split(" ");

    if(fname==null){
      return
      item=="Chicken"
          ?Text(item, style: TextStyle(fontWeight: FontWeight.bold),)
          :Text(item);
    }
    else{
      fname.forEach((element) {
        //print(element);
        finalName.add(element);
        //print(item);

      });
      _searchHistoryController.itemIndex=finalName.length;
      return Row(
        children: [

          for(int i =0; i<=_searchHistoryController.itemIndex-1;i++)
            finalName[i]=="Chicken"?
            Text(finalName[i].toString()+" ",style: TextStyle(fontWeight: FontWeight.bold),)
                :Text(finalName[i]+" "),
        ],
      );
    }
    //print(fname);

  }
}



