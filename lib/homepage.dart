import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int first=0;
  int second=0;
  String opn='';
  String res ='';
  String text='';
  String text2='';
  void btnclick(String btntext){
    if(btntext=='AC') {
      res = '';
      text = '';
      first = 0;
      second = 0;
      text2='';
    }else if(btntext=='+'|| btntext=='-'|| btntext=='x'||btntext=='/'||btntext=='%'||btntext=='.'){
      first=int.parse(text);
      res='';
      opn=btntext;
    }
    else if(btntext=='='){
      second=int.parse(text);

      if(opn=='+'){
        res=(first+second).toString();
      }
      if(opn=='-'){
        res=(first-second).toString();
      }
      if(opn=='x'){
        res=(first*second).toString();
      }
      if(opn=='/'){
        res=(first/second).toString();
      }
if(opn=='%'){
  res=(first%second).toString();
}
  }
    else{
      res=int.parse(text+btntext).toString();

    }
    setState(() {
      text=res;
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('calculator',style: TextStyle(fontSize: 35),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(text2,style: TextStyle(fontSize: 20,color: Colors.white),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(text,style: TextStyle(fontSize: 50,color: Colors.white),textAlign: TextAlign.end,),
              ],
            ),
            Divider(
              height: 50,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildFloatingActionButton("AC", Colors.grey),
                buildFloatingActionButton("⬅️", Colors.grey),
                buildFloatingActionButton("%", Colors.grey),
                buildFloatingActionButton("/", Colors.teal),
              ],
            ),


            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            buildFloatingActionButton("7", Colors.cyan),
            buildFloatingActionButton("8", Colors.cyan),
            buildFloatingActionButton("9", Colors.cyan),
            buildFloatingActionButton("️x", Colors.teal),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            buildFloatingActionButton("4", Colors.cyan),
            buildFloatingActionButton("5", Colors.cyan),
            buildFloatingActionButton("6", Colors.cyan),
            buildFloatingActionButton("-", Colors.teal),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            buildFloatingActionButton("1", Colors.cyan),
            buildFloatingActionButton("2", Colors.cyan),
            buildFloatingActionButton("3", Colors.cyan),
            buildFloatingActionButton("+", Colors.teal),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             lastbutton("0",Colors.cyan),
              lastbutton(".", Colors.cyan),
              lastbutton("=", Colors.orange)


            ],
            )
          ],
        ),
      ),
    );
  }

   lastbutton(String text,Color color) {
    return SizedBox(
      width:100,
      height: 55,
      child: FloatingActionButton(
                onPressed: () {
                  btnclick(text);
                },
      backgroundColor: color,
      child: Text(text,style: TextStyle(fontSize: 30),),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)),
  ),
    );
  }



  SizedBox buildFloatingActionButton(String text, Color color) {
    return SizedBox(
      width: 70,
        height: 70,
      child: FloatingActionButton(
        onPressed: () {
          btnclick(text);
        },
        backgroundColor: color,
        child: Text(text,style: TextStyle(fontSize: 30),),


      ),
    );
  }
}
