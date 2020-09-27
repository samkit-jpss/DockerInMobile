import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyApp(),
    ),
  );
  FlutterStatusbarcolor.setStatusBarColor(Colors.blue.shade900);
}

String cmd;
web(i) async {
  var url = "http://192.168.29.26/cgi-bin/web.py?x=$i";
  var response = await http.get(url);
  print(response.body);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      title: new Text(
        'Welcome to Docker Commands!',
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.blue.shade900),
      ),
      seconds: 15,
      navigateAfterSeconds: AfterSplash(),
      image: new Image.asset('images/docker.gif'),
      backgroundColor: Colors.blue.shade50,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 160.0,
      loaderColor: Colors.blue.shade900,
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade900,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/best.png"),
                ),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(""),
                  Text(""),
                 Text(""),      
                  Text(""),
                  Center(
                    child: Text(
                      "Docker at your service : ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      cmd = value;
                    },
                    textAlign: TextAlign.left,
                    autocorrect: false,
                    autofocus: false,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.comment),
                      hintText: 'Docker Commands',
                    ),
                  ),
                  FlatButton(
                    color: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {
                      web(cmd);
                    },
                    child: Text("RUN"),
                    textColor: Colors.white,
                  )
                ])
          ],
        ),
      ),
    );
  }
}
