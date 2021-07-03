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
  //初期化でFirestoreから呼び出す
  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final snapshot = await Firestore.instance
        .collection('posts')
        .getDocuments();
    // ドキュメント一覧を配列で格納
    setState(() {
      documentList = snapshot.documents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("みんなの質問",style: TextStyle(
          fontWeight: FontWeight.w700
        ),),
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
      body: ListView.builder(
        itemCount: documentList.length,
        itemBuilder: (BuildContext context,int index){
          return Stack(
              children:<Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListTile(
                            title: Text(documentList[index]["name"]),
                            subtitle: Text(documentList[index]["content"]),
                        ),
                      ],
                    ),
                  ),
                )
              ]
          );
        },
      ),
    );

  }

  // Widget movieCard(Movie movie,BuildContext context){
  //   return InkWell(
  //     child: Container(
  //       margin: EdgeInsets.only(left: 60),
  //       width: MediaQuery.of(context).size.width,
  //       height: 120,
  //       child: Card(
  //         color: Colors.black45,
  //         child: Padding(
  //           padding: const EdgeInsets.only(top: 8.0,left: 54),
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Flexible(
  //                       child: Text(movie.title ,style: TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 17,
  //                           color: Colors.white
  //                       ),),
  //                     ),
  //                     Text("Rating: ${movie.imdbRating} / 10 " ,style: TextStyle(
  //                         fontSize: 15,
  //                         color: Colors.grey
  //                     ),)
  //                   ],
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: [
  //                     Text("Released: ${movie.released}",style: mainTextStyle()),
  //                     Text(movie.runtime,style: mainTextStyle()),
  //                     Text(movie.rated,style: mainTextStyle(),)
  //                   ],
  //                 )
  //
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //     onTap: () => {
  //       Navigator.push(context, MaterialPageRoute(
  //           builder: (context)=> MovieListViewDetails(
  //             movieName: movie.title,movie: movie,))),
  //     },
  //   );
  // }

}

