// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:honeyroom/chart/sales.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class salesHomePage extends StatefulWidget {
//   salesHomePage({Key key}) : super(key: key);

//   @override
//   _salesHomePageState createState() => _salesHomePageState();
// }

// class _salesHomePageState extends State<salesHomePage> {
//   List<charts.Series<Sales, String>> _seriesBarData;
//   List<Sales> myData;
//   _generateData(myData) {
//     _seriesBarData.add(charts.Series(
//         domainFn: (Sales sales, _) => sales.saleYear.toString(),
//         measureFn: (Sales sales, _) => sales.saleVal,
//         colorFn: (Sales sales, _) =>
//             charts.ColorUtil.fromDartColor(Color(int.parse(sales.colorVal))),
//         id: 'Sales',
//         data: myData,
//         labelAccessorFn: (Sales row, _) => "${row.saleYear}"));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('sales'),
//       ),
//       body: _buildBody(context),
//     );
//   }

//   Widget _buildBody(context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('sales').snapshots(),
//       builder: (context, snapshot){
//         if(!snapshot.hasData){
//           return LinearProgressIndicator();
//         }
//         else{
//           List<Sales> sales = snapshot.data.map((DocumentSnapshot)=>Sales.fromMap(DocumentSnapshot.data)).toList();
//         }
//         }

//     )
//   }
// }
