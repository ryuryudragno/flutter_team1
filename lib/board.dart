import 'package:benesse_hackathon/home.dart';
import 'package:benesse_hackathon/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firestore.initializeApp();
//   runApp(MyApp());
// }



class board extends StatelessWidget {
  final FirebaseUser user;
  board({Key? key,required this.user});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(user: user,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;
  MyHomePage({Key? key,required this.user});

  @override
  _MyHomePageState createState() => _MyHomePageState(user: user);
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseUser user;

  _MyHomePageState({Key? key, required this.user});

  // ドキュメント情報を入れる箱を用意
  List<DocumentSnapshot> documentList = [];

  //初期化でFirestoreから呼び出す
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final snapshot =
    await Firestore.instance.collection('posts').getDocuments();
    // ドキュメント一覧を配列で格納
    setState(() {
      documentList = snapshot.documents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: documentList.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      border: Border.all(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blueGrey.shade900,
                              child: Text(
                                documentList[index]["name"].substring(0, 1),
                                style: TextStyle(
                                    color: Colors.white60
                                ),),
                            ),
                          ),
                          //childrenの直下に持ってくると改行が起きなくなる https://www.it-swarm-ja.com/ja/flutter/%E3%82%AA%E3%83%BC%E3%83%90%E3%83%BC%E3%83%95%E3%83%AD%E3%83%BC%E3%81%AE%E4%BB%A3%E3%82%8F%E3%82%8A%E3%81%AB%E3%83%86%E3%82%AD%E3%82%B9%E3%83%88%E3%82%92%E3%83%95%E3%83%A9%E3%83%83%E3%82%BF%E3%83%BC%E3%83%A9%E3%83%83%E3%83%97/809329793/
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(documentList[index]["title"],
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
                                    textAlign: TextAlign.left,
                                  ),


                                  Text(documentList[index]["content"],
                                    overflow: TextOverflow.visible,
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 12,

                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
              ]
              );
            }
        )
    );
  }


}
