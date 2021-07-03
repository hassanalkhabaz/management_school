import 'package:flutter/material.dart';
import 'package:management_school/my_cache.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    getCache();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      
    );
  }

  void getCache() {
    MyCache.getString('token').then((val) {
      val == ""? Navigator.of(context).pushReplacementNamed('/login')
      : Navigator.of(context).pushReplacementNamed('/home');
    });
  }
}
