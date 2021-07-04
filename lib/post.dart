import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {

  @override
  _PostPagePageState createState() => _PostPagePageState();
}

class _PostPagePageState extends State<PostPage> {

  TextEditingController _textEditingController = TextEditingController();
  final myController = TextEditingController();
  late String name;
  late String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("投稿画面",style: TextStyle(
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
                  decoration: InputDecoration(labelText: 'タイトル'),
                  textInputAction: TextInputAction.next,
                  onChanged: (text) {
                    name = text;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '内容'),
                  obscureText: false,
                  onChanged: (text) {
                    content = text;
                  },
                ),
                RaisedButton(
                  child: Text('Save-button'),
                  onPressed: () async {
                    // ドキュメント作成
                    // final hobbyText = myController.text;
                    // debugPrint(hobbyText);
                    await Firestore.instance
                        .collection('posts') // コレクションID
                        .document() // ここは空欄だと自動でIDが付く
                        .setData({
                      'name': name,
                      'content': content,
                    }); // データ
                  },
                ),
              ],
            ),
          ),
        ),

        // child: TextField(
        //   controller: _textEditingController,
        //   enabled: true,
        //   maxLength: 50, // 入力数
        //   maxLengthEnforced: false, // 入力上限になったときに、文字入力を抑制するか
        //   style: TextStyle(color: Colors.black),
        //   obscureText: false,
        //   maxLines:1 ,
        //   decoration: const InputDecoration(
        //     icon: Icon(Icons.speaker_notes),
        //     hintText: '投稿内容を記載します',
        //     labelText: '内容 * ',
        //   ),
        // ),
      ),
    );
  }
}