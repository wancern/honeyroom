// API 호출 부분(공공데이터 실거래 정보)

import 'dart:convert';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;
import 'Users.dart';

class Services {
  static Xml2Json xml2Json = Xml2Json();
  static Future<List<User>> getUsers() async {
    var date = 202103;
    var landcode = 11740;
    String url =
        'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade?serviceKey=VsP3C42h0DXIcxUFSjfmt%2F7f5y4Um%2Bvne3HVTGecAlAuTXYShcM1VHSAH5S3yNj%2FW0qHqv7ubtuUQmdRbSYoXg%3D%3D&LAWD_CD=${landcode}&DEAL_YMD=${date}';
    String url2 =
        'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade?serviceKey=VsP3C42h0DXIcxUFSjfmt%2F7f5y4Um%2Bvne3HVTGecAlAuTXYShcM1VHSAH5S3yNj%2FW0qHqv7ubtuUQmdRbSYoXg%3D%3D&LAWD_CD=11740&DEAL_YMD=202103';

    final response = await http.get(url);
    var response1 = utf8.decode(response.bodyBytes);
    xml2Json.parse(response1);
    var jsonString = xml2Json.toParker();
    var data = jsonDecode(jsonString);

    final List<User> users =
        usersFromJson(data['response']['body']['items']['item']);

    return users;
  }
}
