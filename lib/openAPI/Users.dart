List<User> usersFromJson(var data) {
  return List<User>.from(data.map((x) => User.fromJson(x)));
}

class User {
  User(
      {this.transactionAmount,
      this.constructionYear,
      this.year,
      this.address,
      this.apartment,
      this.month,
      this.date,
      this.squareMeasure,
      this.number,
      this.code,
      this.floor,
      this.dismantle,
      this.dismantleDate});

  String transactionAmount;
  String constructionYear;
  String year;
  String address;
  String apartment;
  String month;
  String date;
  String squareMeasure;
  String number;
  String code;
  String floor;
  String dismantle;
  String dismantleDate;

  factory User.fromJson(Map<String, dynamic> json) => User(
        transactionAmount: json["거래금액"],
        constructionYear: json["건축년도"],
        year: json["년"],
        address: json["법정동"],
        apartment: json['아파트'],
        month: json['월'],
        date: json["일"],
        squareMeasure: json["전용면적"],
        number: json['지번'],
        code: json['지역코드'],
        floor: json['층'],
        dismantle: json['해체사유발생일'],
        dismantleDate: json['해체여부'],
      );
}
