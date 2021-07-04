import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class bottomNavi extends StatefulWidget {
  const bottomNavi({Key? key}) : super(key: key);

  @override
  _bottomNaviState createState() => _bottomNaviState();
}

class _bottomNaviState extends State<bottomNavi> {

  int _selectedIndex = 0;

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
      if(_selectedIndex == 0){
        Navigator.push(
            context, MaterialPageRoute(builder: (context)=> board())
        );
      }

      if(_selectedIndex == 1){
        Navigator.push(
            context, MaterialPageRoute(builder: (context)=> PostPage())
        );
      }
      if(_selectedIndex == 2){
        Navigator.push(
            context, MaterialPageRoute(builder: (context)=> Profile(userName: user))
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }



}





Widget bottomNavi(){
  return BottomNavigationBar(
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

  );
}

