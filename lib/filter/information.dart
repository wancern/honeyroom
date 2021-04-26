import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:honeyroom/openAPI/Users.dart';
import 'package:honeyroom/firestore/adminData.dart';

class InfoPage extends StatefulWidget {
  InfoPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _InfoPageState createState() => _InfoPageState();
}

final List<String> imgList = [
  'assets/images/sample_1.png',
  'assets/images/sample_2.png',
  'assets/images/sample_3.png',
  'assets/images/sample_4.png'
];

class _InfoPageState extends State<InfoPage> {
  List<User> _users;
  bool _loading;

  //firebase 데이터 읽는 부분
  @override
  void initState() {
    super.initState();
    _loading = true;
    ReadData.readData().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _loading ? _printMenu("Loading...") : _printMenu("상세 정보"),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person), tooltip: '사용자 정보', onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Padding(padding: EdgeInsets.all(5.0)),
            _printMenu('매물사진'),
            _printImage(),
            Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                color: Colors.black12,
                height: 10,
              ),
            ),

            _printMenu('매물정보'),
            Padding(padding: EdgeInsets.all(10.0)),
            // 데이터 출력 부분
            Container(
              height: 220,
              child: ListView.builder(
                  itemCount: null == _users ? 0 : 1,
                  itemBuilder: (context, index) {
                    User user = _users[index];
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
                    return Column(children: <Widget>[
                      Container(height: 1, color: Colors.black12),
                      _printOption('거래금액', user.transactionAmount),
                      Container(height: 1, color: Colors.black12),
                      _printOption('건축년도', user.constructionYear),
                      Container(height: 1, color: Colors.black12),
                      _printOption('법정동', user.address),
                      Container(height: 1, color: Colors.black12),
                      _printOption('아파트', user.apartment),
                      Container(height: 1, color: Colors.black12),
                      _printOption('전용면적', user.squareMeasure),
                      Container(height: 1, color: Colors.black12),
                      _printOption('층', user.floor),
                      Container(height: 1, color: Colors.black12),
                    ]);
                  }),
            ),
/*
            Container(height: 1, color: Colors.black12),
            _printOption('거래금액', '5000'),
            Container(height: 1, color: Colors.black12),
            _printOption('전용면적', '101'),
            Container(height: 1, color: Colors.black12),
            _printOption('층수', '11/20'),
            Container(height: 1, color: Colors.black12),
            _printOption('건축년도', '2009'),
            Container(height: 1, color: Colors.black12),
            Padding(padding: EdgeInsets.all(10.0)),
*/
            Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                color: Colors.black12,
                height: 10,
              ),
            ),
            _printMenu('편의시설'),
            Padding(padding: EdgeInsets.all(10.0)),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[Icon(Icons.directions_bus), Text('버스정류장')],
                ),
                Padding(padding: EdgeInsets.all(5)),
                Column(
                  children: <Widget>[
                    Icon(Icons.elevator_outlined),
                    Text('엘레베이터')
                  ],
                ),
                Padding(padding: EdgeInsets.all(5)),
                Column(
                  children: <Widget>[
                    Icon(Icons.local_hospital_outlined),
                    Text('병원')
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                color: Colors.black12,
                height: 10,
              ),
            ),
            _printMenu('편의시설'),
            Padding(padding: EdgeInsets.all(10.0)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('버스정류장'),
                Text('엘레베이터'),
                Text('병원'),
                Text('버스정류장'),
                Text('엘레베이터'),
                Text('병원'),
                Text('버스정류장'),
                Text('엘레베이터'),
                Text('병원'),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                color: Colors.black12,
                height: 10,
              ),
            ),
          ])),
    );
  }

  Widget _printMenu(var n) {
    return (Container(
        child: Center(
      child: (Text(n,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
    )));
  }

  Widget _printOption(var n, var m) {
    return (Row(
      children: <Widget>[
        Container(
          child: Text(
            n,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          width: 100,
        ),
        Container(
          child: Text(
            m,
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.start,
          ),
          width: 100,
        ),
      ],
    ));
  }

  Widget _printImage() {
    return (Container(
      height: 200,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Swiper(
          scale: 0.9,
          viewportFraction: 0.8,
          control: SwiperControl(),
          pagination: SwiperPagination(alignment: Alignment.bottomRight),
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(imgList[index]);
          },
        ),
      ),
    ));
  }
}
