import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:benesse_hackathon/post.dart';
import 'package:flutter/material.dart';

import 'home.dart';
//import 'package:lib/keijiban.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestPage(),
    );
  }
}


class TestPage extends StatelessWidget {

  // Google 認証
  final _google_signin  = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
  late GoogleSignInAccount googleUser;
  late GoogleSignInAuthentication googleAuth;
  late AuthCredential credential;

  // Firebase 認証
  final _auth = FirebaseAuth.instance;
  late AuthResult result;
  late FirebaseUser user;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network('https://www.change-your-tomorrow.com/wp-content/uploads/2018/12/google-logo-eyecatch.png'),
            ButtonTheme(
              minWidth: 350.0,
              // height: 100.0,
              child: RaisedButton(
                  child: Text('Google認証',
                    style: TextStyle(fontWeight: FontWeight.bold),),
                  textColor: Colors.white,
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  onPressed: () async {

                    // Google認証の部分
                    googleUser = await _google_signin.signIn();
                    googleAuth = await googleUser.authentication;

                    credential = GoogleAuthProvider.getCredential(
                      accessToken: googleAuth.accessToken,
                      idToken: googleAuth.idToken,
                    );

                    // Google認証を通過した後、Firebase側にログイン　※emailが存在しなければ登録
                    try {
                      result = await _auth.signInWithCredential(credential);
                      user = result.user;
                      //Firestoreに保存
                      await Firestore.instance
                          .collection('users') // コレクションID
                          .document('${user.uid}') // ここは空欄だと自動でIDが付く
                          .setData({
                        'googleName': user.displayName,
                      }); // データ
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(user: user),
                          )
                      );

                    } catch (e) {
                      print(e);
                    }
                  }
              ),
            ),

            ButtonTheme(
              minWidth: 350.0,
              // height: 100.0,
              child: RaisedButton(
                  child: Text('Google認証ログアウト',
                    style: TextStyle(fontWeight: FontWeight.bold),),
                  textColor: Colors.white,
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  onPressed: () {
                    _auth.signOut();
                    _google_signin.signOut();
                    print('サインアウトしました。');
                  }
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('別のGoogleアカウントでログインしたい場合、\n一回ログアウトする必要がある。'),
            ),

          ],
        ),
      ),
    );
  }
}

