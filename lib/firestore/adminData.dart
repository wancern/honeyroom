import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honeyroom/openAPI/Users.dart';

// 데이터를 firebase에 추가하는 부분
void addData(
    String transactionAmount,
    String constructionYear,
    String year,
    String address,
    String apartment,
    String month,
    String date,
    String squareMeasure,
    String number,
    String code,
    String floor) async {
  FirebaseFirestore addData = FirebaseFirestore.instance;

  // collection 이름은 상황에 맞춰 바꿔야함 -> 필터기능 구현할 때 컬렉션에 들어가는 이름은 자동으로 설정되도록 변경할 필요 있음.
  addData.collection('서울아파트').add({
    '거래금액': transactionAmount,
    '건축년도': constructionYear,
    '년': year,
    '법정동': address,
    '아파트': apartment,
    '월': month,
    '일': date,
    '전용면적': squareMeasure,
    '지번': number,
    '지역코드': code,
    '층': floor
  });
}

// firebase의 데이터를 읽어오는 부분
class ReadData {
  static Future<List<User>> readData() async {
    FirebaseFirestore readData = FirebaseFirestore.instance;
    List _users = [];

    await for (var snapshot in readData.collection('서울아파트').snapshots()) {
      for (var messege in snapshot.docs) {
        _users.add(messege.data());
      }
      final List<User> users = usersFromJson(_users);
      return users;
    }
  }
}
