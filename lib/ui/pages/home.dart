import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flu/ui/widgets/MyDrawer.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        backgroundColor: Colors.cyan[400],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          coloredCard(title: 'Alerts', content:'2', colors: 2),
          coloredCard(title: 'Activities', content:'0', colors: 3),
          coloredCard(title: 'Homeworks', content:'1', colors: 4),
          coloredCard(title: 'Something', content:'4', colors: 1),
        ],
      ),
    );
  }

  Container coloredCard({title, content, int colors = 0}) {
    var colorsOps = [
      [Colors.indigo[300], Colors.purple[300]],
      [Colors.blue[300], Colors.indigo[300]],
      [Colors.lightGreen[300], Colors.green[300]],
      [Colors.purple[300], Colors.pink[300]],
      [Colors.orange[300], Colors.deepOrange[300]],
    ];
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.grey[50],
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.grey[50]),
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 3,
                offset: Offset(0, 2),
                blurRadius: 8)
          ],
          gradient: LinearGradient(colors: colorsOps[colors])),
      height: 80,
    );
  }
}
