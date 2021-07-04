import 'package:benesse_hackathon/board.dart';
import 'package:benesse_hackathon/post.dart';
import 'package:benesse_hackathon/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  final FirebaseUser user;
  Home({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HomePage(user: user),
    );
  }
}

class HomePage extends StatefulWidget {
  final FirebaseUser user;
  HomePage({Key? key, required this.user}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState(user: user);
}

// [Themelist] インスタンスにおける処理。
class _HomePageState extends State<HomePage> {
  final FirebaseUser user;
  _HomePageState({Key? key, required this.user});

  int _selectedIndex = 0;
  final List<Widget> _children = [
    board(),
    PostPage(),
    Profile()
  ];
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex], // new
      // body: Center(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Text('ようこそ',
      //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      //       Text(user.displayName),
      //     ],
      //   ),
      // ),
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

// class _BottomTabbarExampleState extends State<BottomTabbarExample>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//
//   static const _kTabPages = <Widget>[
//     Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
//     Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
//     Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
//   ];
//   static const _kTabs = <Tab>[
//     Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
//     Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
//     Tab(icon: Icon(Icons.forum), text: 'Tab3'),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(
//       length: _kTabPages.length,
//       vsync: this,
//     );
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TabBarView(
//         controller: _tabController,
//         children: _kTabPages,
//       ),
//       bottomNavigationBar: Material(
//         color: Colors.blue,
//         child: TabBar(
//           tabs: _kTabs,
//           controller: _tabController,
//         ),
//       ),
//     );
//   }
// }
