import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:honeyroom/openAPI/JsonParseDemo.dart';
import 'package:honeyroom/filter/villa.dart';
import 'package:honeyroom/filter/apartment.dart';
import 'package:honeyroom/filter/officetel.dart';
import 'package:honeyroom/filter/information.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow[600],
      ),
      home: HoneyRoomPage(),
    );
  }
}

class HoneyRoomPage extends StatefulWidget {
  HoneyRoomPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HoneyRoomPageState createState() => _HoneyRoomPageState();
}

class _HoneyRoomPageState extends State<HoneyRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("메뉴"),
        elevation: 0.0,
        leading: IconButton(
            icon: Image.asset('assets/images/RoomGo.png'),
            tooltip: '메뉴',
            onPressed: () {}),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person), tooltip: '사용자 정보', onPressed: () {})
        ],
      ),
      body: Column(children: <Widget>[
        ElevatedButton(
          child: Text('빌라', style: TextStyle(fontSize: 24)),
          onPressed: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => VillaPage()));
          },
        ),
        ElevatedButton(
          child: Text('오피스텔', style: TextStyle(fontSize: 24)),
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => OfficePage()));
          },
        ),
        ElevatedButton(
          child: Text('아파트', style: TextStyle(fontSize: 24)),
          onPressed: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => ApartPage()));
          },
        ),
        ElevatedButton(
          child: Text('상세정보', style: TextStyle(fontSize: 24)),
          onPressed: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => InfoPage()));
          },
        ),
        ElevatedButton(
          child: Text('jsonDemo', style: TextStyle(fontSize: 24)),
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => JsonParseDemo()));
          },
        ),
      ]),
    );
  }
}
