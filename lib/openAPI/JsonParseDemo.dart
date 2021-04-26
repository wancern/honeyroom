import 'package:flutter/material.dart';
import 'Services.dart';
import 'Users.dart';
import 'package:honeyroom/firestore/adminData.dart';

class JsonParseDemo extends StatefulWidget {
  JsonParseDemo() : super();

  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  List<User> _users;
  bool _loading;

  @override
  // api 호출 부분
  void initState() {
    super.initState();
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  //firebase 데이터 읽는 부분
  // @override
  // void initState() {
  //   super.initState();
  //   _loading = true;
  //   ReadData.readData().then((users) {
  //     setState(() {
  //       _users = users;
  //       _loading = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Users'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: null == _users ? 0 : 2,
            itemBuilder: (context, index) {
              User user = _users[index];
              //데이터를 firebase에 추가하는 부분
              addData(
                  user.transactionAmount,
                  user.constructionYear,
                  user.year,
                  user.address,
                  user.apartment,
                  user.month,
                  user.date,
                  user.squareMeasure,
                  user.number,
                  user.code,
                  user.floor);
              return ListTile(
                title: Text(user.apartment),
                subtitle: Text(user.address),
              );
            }),
      ),
    );
  }
}
