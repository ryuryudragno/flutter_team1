import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// void main() {
//   runApp(MyApp()); // Statelessウィジェットの呼び出し
// }

// Statelessウィジェットを定義
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("images/face.jpg"),
            ),
            Container(
              width: 500,
              child: TextField(
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                //maxLength: 16,
                style: TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  //labelText: 'ひとこと *',
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                  hintText: '名前 *',
                  //enabledBorder: OutlineInputBorder(
                  //  borderRadius: new BorderRadius.circular(30.0),
                  //  borderSide: BorderSide(
                  //  color: Colors.blueGrey,
                  //  ),
                  //),
                ),
              ),
            ),

            Container(
              width: 500,
              child: TextField(
                //autofocus: true,
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  //labelText: 'ひとこと *',
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                  hintText: '学年 *',
                ),
              ),
            ),
            //Text(
            //  "○○高校3年",
            //  style: TextStyle(
            //    fontFamily: "SourceSansPro",
            //    fontSize: 20.0,
            //    letterSpacing: 2.0,
            //    fontWeight: FontWeight.bold,
            //    color: Colors.teal[50],
            //  ),
            //),
            SizedBox(
              height: 30.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal[100],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 50,
              ),
              child: ListTile(
                title: TextField(
                  maxLength: 16,
                  decoration: InputDecoration(
                    labelText: '得意教科 *',
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 50,
              ),
              child: ListTile(
                title: TextField(
                  maxLength: 16,
                  decoration: InputDecoration(
                    labelText: '苦手教科 *',
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 50,
              ),
              child: ListTile(
                title: TextField(
                  //maxLength: 16,
                  decoration: InputDecoration(
                    labelText: 'ひとこと *',
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}




//中央並べ
//--------------------------------------------------------------------//
//import 'package:flutter/material.dart';
//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Flutter Demo',
//      theme: new ThemeData(
//          primaryColor: Colors.white
//      ),
//      home: new MyHomePage(),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("プロフィール"),
//      ),
//      body: new Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text('name'),
//            Text('学年'),
//            Text('得意科目'),
//            Text('苦手科目'),
//            Text('ひとこと'),
//          ],
//        )
//
//      ),
//    );
//  }
//}



//-------------------------------------------------------------//
//import 'package:benesse_hackathon/post.dart';
//import 'package:flutter/material.dart';
//
//import 'kenta.dart';
////import 'package:lib/keijiban.dart';
//
//void main() {
//  runApp(MyApp());
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: TextButton(
//          child: Text('プロフィール'),
//          onPressed: () {
//            // ここにボタンを押した時に呼ばれるコードを書く
//
//        },),
//        title: Text("掲示板デモ"),
//        actions: [
//          IconButton(
//            icon: Icon(Icons.edit), onPressed: () {
//            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//              return PostPage();
//            }));
//          },
//          ),
//        ],
//      ),
//      body: Center(
//        child: Text(
//            "ここにみんなの投稿が流れる"
//        ),
//      ),
//    );
//  }
//}
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
////
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key? key, required this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//-------------------------------------------------------------------------------//









//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
//