import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:benesse_hackathon/post.dart';
import 'package:flutter/material.dart';

import 'kenta.dart';
//import 'package:lib/keijiban.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firestore.initializeApp();
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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // ドキュメント情報を入れる箱を用意
  List<DocumentSnapshot> documentList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("掲示板デモ"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return PostPage();
            }));
          },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('LoadAlldocs'),
              onPressed: () async {
                // 指定コレクションのドキュメント一覧を取得
                final snapshot = await Firestore.instance
                    .collection('posts')
                    .getDocuments();
                // ドキュメント一覧を配列で格納
                setState(() {
                  documentList = snapshot.documents;
                });
              },
            ),
            // ドキュメント情報を表示
            Column(
              children: documentList.map((document) {
                return ListTile(
                  title: Text('name:${document['content']}'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

