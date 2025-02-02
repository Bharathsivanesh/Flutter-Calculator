import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calulator'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            )),
            Row(
              children: <Widget>[
                buildOutlinedButton("9"),
                buildOutlinedButton("8"),
                buildOutlinedButton("7"),
                buildOutlinedButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                buildOutlinedButton("6"),
                buildOutlinedButton("5"),
                buildOutlinedButton("4"),
                buildOutlinedButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                buildOutlinedButton("3"),
                buildOutlinedButton("2"),
                buildOutlinedButton("1"),
                buildOutlinedButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                buildOutlinedButton("c"),
                buildOutlinedButton("0"),
                buildOutlinedButton("="),
                buildOutlinedButton("/"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildOutlinedButton(String val) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnclicked(val),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            val,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  int? first;
  int? second;
  String res = "", text = "";
  String? opp;
  void btnclicked(String value) {
    if (value == "c") {
      text = "";
      res = "";
    } else if (value == "+" || value == "-" || value == "*" || value == "/") {
      first = int.parse(text);
      res = "";
      opp = value;
    } else if (value == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first! + second!).toString();
      }
      if (opp == "-") {
        res = (first! - second!).toString();
      }
      if (opp == "*") {
        res = (first! * second!).toString();
      }
      if (opp == "/") {
        res = (first! / second!).toString();
      }
    } else {
      res = int.parse(text + value).toString();
    }
    setState(() {
      text = res;
    });
  }
}
