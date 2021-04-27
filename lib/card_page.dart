import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:expandable_listview/notelist.dart';

//We create cards class to add to the list and print it on the screen.
class Card {
  //We create 2 items as title and content of your card class
  String title;
  String content;

  Card(String title, String content) {
    this.title = title;
    this.content = content;
  }
}

//we define the colors 1 time to use the same shades again
Color color1 = const Color.fromRGBO(255, 205, 163, 1.0);
Color color2 = const Color.fromRGBO(238, 149, 149, 0.6);
Color color3 = const Color.fromRGBO(192, 137, 115, 1.0);
Color color4 = const Color.fromRGBO(218, 114, 60, 1.0);

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  TextEditingController _titlecontoller = TextEditingController();
  TextEditingController _contentcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: Cards.length,
        itemBuilder: (context, index) {
          return buildExpansionTileCard(index);
        },
      ),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      title: Text("Expandable ListView"),
      backgroundColor: color1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(25, 50),
        ),
      ),
      toolbarHeight: 80,
    );
  }



  ExpansionTileCard buildExpansionTileCard(int index) {
    return ExpansionTileCard(

    //Creates a widget to the right of the card's title block

   /*   trailing: Icon(Icons.check),
        or
        trailing: TextButton(onPressed:(){}),
    */
      //
          expandedColor: color4,
          expandedTextColor: Colors.black,
          borderRadius: BorderRadius.circular(25),
          //We take the titles from the card list
          title: Text(Cards[index].title),

          children: [
            //this children part is the widget part that opens under the title block
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(Cards[index].content),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                Cards.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: TextButton(onPressed: () {}, child: Text("Share",style: TextStyle(color: Colors.black),)),),
                      Expanded(child: TextButton(onPressed: () {}, child: Text("Edit",style: TextStyle(color: Colors.black))),)
                    ],
                  )
                ],
              ),
            ),
          ],
        );
  }







//We add a new note by clicking the button to see the updates on the cards.
  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(

      child: Icon(Icons.add),
      backgroundColor: color4,
      onPressed: (){

        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(
                  height:225,child: Column(children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                    controller: _titlecontoller,
                    decoration: InputDecoration(hintText: "Title Text Area in Dialog Box",
                    ),
                  ),
                  TextField(
                    maxLines: 6,
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                    controller: _contentcontroller,
                    decoration: InputDecoration(hintText: "Content Text Area in Dialog Box",
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)
                      ),
                    ),
                  ),
                ],),),
                actions: <Widget>[
                  TextButton(

                    child: Text('Save'),
                    onPressed: () {
                      setState(() {
                        Cards.add(Card(_titlecontoller.text,_contentcontroller.text));
                        Navigator.pop(context);
                        _contentcontroller.text = "";
                        _titlecontoller.text="";
                      });
                    },
                  ),

                ],
              );
            });
      },
    );
  }
}

