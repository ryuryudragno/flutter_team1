import 'package:benesse_hackathon/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class PostPage extends StatefulWidget {
  final FirebaseUser user;
  const PostPage({Key? key,required this.user}) : super(key: key);
  @override
  _PostPagePageState createState() => _PostPagePageState(user:user);
}

class _PostPagePageState extends State<PostPage> {
  final FirebaseUser user;
  _PostPagePageState({Key? key,required this.user});

  TextEditingController _textEditingController = TextEditingController();
  final myController = TextEditingController();
  late String title;
  late String content;

  int _selectedIndex = 1;
  late String userName;

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
      if(_selectedIndex == 0){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home(user: user)),
        );
      }
      if(_selectedIndex == 1){
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => PostPage(user: user,)),
        // );
      }
      if(_selectedIndex == 2){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile(user: user)),
        );
      }
    });
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final snapshot =
    await Firestore.instance.collection('users').document("${user.uid}").get();
    // ??????????????????????????????????????????
    setState(() {
      if(snapshot.data["name"]!=null){
        userName = snapshot.data["name"];
      }else{
        userName = "?????????";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("????????????",style: TextStyle(
          fontWeight: FontWeight.w700,
        ),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: '????????????'),
                  textInputAction: TextInputAction.next,
                  onChanged: (text) {
                    title = text;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      helperText: '?????????????????????????????????????????????',
                      labelText: '??????',
                    ),
                    onChanged: (text) {
                      content = text;
                    },
                  ),
                ),
                RaisedButton(
                  child: Text('Save-button'),
                  onPressed: () async {
                    // ????????????????????????
                    // final hobbyText = myController.text;
                    // debugPrint(hobbyText);
                    await Firestore.instance
                        .collection('posts') // ??????????????????ID
                        .document() // ??????????????????????????????ID?????????
                        .setData({
                      "name": userName,
                      'title': title,
                      'content': content,
                    }); // ?????????
                  },
                ),
              ],
            ),
          ),
        ),
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
    );
  }
}