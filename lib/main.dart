import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'GDL Contador de Pessoas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _infText = "Pode Entrar!";

  void _incrementCounter(int value) {
    //solicita ao build() para redesenhar a tela
    setState(() {
      _counter += value;

      if(_counter < 0){
        _infText = "Invertido!";
      } else if (_counter >=0 && _counter <= 19) {
        _infText = "Passe Livre!";
      } else if (_counter >= 20 && _counter <= 29) {
        _infText = "Atenção!";
      } else if (_counter >= 30) {
        _infText = "Lotado!";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "staticfiles/img/rest-bg4.jpg",
              fit: BoxFit.cover,
              height: 1000.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$_infText",
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: 70.0,
                  ),
                ),
                Text(
                  "Pessoas: $_counter",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "+1",
                          style: TextStyle(
                              fontSize: 50.0,
                              color: Colors.white
                          ),
                        ),
                        onPressed: () {
                          _incrementCounter(1);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "-1",
                          style: TextStyle(
                              fontSize: 50.0,
                              color: Colors.white
                          ),
                        ),
                        onPressed: () {
                          _incrementCounter(-1);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ),
      /*
      floatingActionButton: FloatingActionButton(
        //onPressed:
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      */
    );
  }
}
