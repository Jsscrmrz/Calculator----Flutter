import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LabExamCalc(),
    ));

class LabExamCalc extends StatefulWidget {
  @override
  _LabExamCalcState createState() => _LabExamCalcState();
}

class _LabExamCalcState extends State<LabExamCalc> {
  String dis = "0"; //display
  String out = "0"; //output
  double n1 = 0.0; //number 1
  double n2 = 0.0; //number 2
  String function = ""; //function

  buttonPressed(String val) { //input
    print(val); //show btn value in console
    if (val == "C") {
      //delete
      out = "0";
      n1 = 0;
      n2 = 0;
      function = "";

      // four operations
    } else if (val == "+" || val == "-" || val == "*" || val == "/") {
      n1 = double.parse(dis);
      function = val;
      out = "0";
      dis = dis + val;
    } else if (val == ".") {
      if (out.contains(".")) {
        print("0");
        return;
      } else {
        out = out + val;
      }
    } else if (val == "=") {
      //display total

      n2 = double.parse(dis);

      if (function == "+") {
        //addition
        out = (n2 + n1).toString();
      }
      if (function == "-") {
        //subtraction
        out = (n1 - n2).toString();
      }
      if (function == "*") {
        //multiplication
        out = (n2 * n1).toString();
      }
      if (function == "/") {
        //division
        out = (n1 / n2).toString();
      }
      n1 = 0;
      n2 = 0;
      //del = "0";
    } else {
      out = out + val;
    }

    setState(() {
      dis = double.parse(out).toStringAsFixed(2);
    });
  }

  Widget buildButton(String btnVal) {
    //buttons style
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
                // Box Shadow of buttons
                color: Colors.blue,
                offset: Offset(1.0, 1.0),
                blurRadius: 8.0,
                spreadRadius: 1.0),
            BoxShadow(
                // Box Shadow of buttons
                color: Colors.greenAccent,
                offset: Offset(3.0, 3.0),
                blurRadius: 8.0,
                spreadRadius: 2.0),

          ],
        ),
        child: MaterialButton(
          padding: EdgeInsets.all(25.0),
          child: Text(
            btnVal,
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () =>
              buttonPressed(btnVal), //if pressed the button the value display
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            //AppBar
            title: Text('Calculator'),
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
            backgroundColor: Colors.lightBlueAccent,
            shadowColor: Colors.greenAccent,
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 65.0),
                    child: Text(
                      dis,
                      style: TextStyle(fontSize: 65.0),
                    )),
                Expanded(
                  child: Divider(),
                ),
                Column(
                  // Row and Column of all button
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        buildButton("."),
                        buildButton("C"),
                        buildButton("*")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("7"),
                        buildButton("8"),
                        buildButton("9"),
                        buildButton("/")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("4"),
                        buildButton("5"),
                        buildButton("6"),
                        buildButton("+")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("1"),
                        buildButton("2"),
                        buildButton("3"),
                        buildButton("-")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("0"),
                        buildButton("="),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}
