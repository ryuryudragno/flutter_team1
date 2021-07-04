import 'package:benesse_hackathon/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'board.dart';
import 'home.dart';



class Profile extends StatefulWidget {
  final FirebaseUser user;
  const Profile({Key? key,required this.user}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState(user: user);
}

class _ProfileState extends State<Profile> {
  final FirebaseUser user;

  _ProfileState({Key? key, required this.user});


  late String name;
  late String grade;
  late String goodsub;
  late String badsub;
  late String comment;

  int _selectedIndex = 2;
  List<DocumentSnapshot> documentList = [];

  late TabController _tabController;
  static const _kTabPages = <Widget>[
    Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
    Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
    Tab(icon: Icon(Icons.forum), text: 'Tab3'),
  ];

  // final List<Widget> _children = [
  //   board(),
  //   PostPage(),
  //   Profile(user: user),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home(user: user)),
        );
      }
      if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostPage(user: user,)),
        );
      }
      if (_selectedIndex == 2) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Profile(user: user)),
        // );
      }
    });
  }

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
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                onChanged: (text) {
                  name = text;
                },
                decoration: InputDecoration(
                  //labelText: 'ひとこと *',
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                  hintText: '名前 *',
                ),
              ),
            ),

            Container(
              width: 500,
              child: TextField(
                onChanged: (text) {
                  grade = text;
                },
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
                  onChanged: (text) {
                    goodsub = text;
                  },
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
                  onChanged: (text) {
                    badsub = text;
                  },
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
                  onChanged: (text) {
                    comment = text;
                  },
                  decoration: InputDecoration(
                    labelText: 'ひとこと *',
                  ),
                ),

              ),
            ),
            RaisedButton(
              child: Text('Save-button'),
              onPressed: () async {
                // ドキュメント作成
                // final hobbyText = myController.text;
                // debugPrint(hobbyText);
                await Firestore.instance
                    .collection('users') // コレクションID
                    .document("${user.uid}") // ここは空欄だと自動でIDが付く
                    .updateData({
                  'name': name,
                  'grade': grade,
                  'good_sub': goodsub,
                  'bad_sub': badsub,
                  'comment': comment,
                }); // データ
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment_outlined),
              title: Text('Board'),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              title: Text('Post'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              title: Text('Profile'),
            ),
          ],

        ),
      ),
    );
  }
}
