import 'dart:ffi';

import 'package:charts/screens/add_chart_screen.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  bool  isShown ;
  initState(){
    prefrances();
    super.initState();
  }
  prefrances()async{
    SharedPreferences pref = await  SharedPreferences.getInstance();
    setState(() {
      this.isShown = pref.getBool('isShown');
    });
  }
  final pages = [
    PageViewModel(
    pageColor: const Color.fromRGBO(229, 86, 101,1),
    iconImageAssetPath: null,
    iconColor: null,
    bubbleBackgroundColor: Colors.grey,
    body: Text(
      'تطبيق البيانات الاسعلاميه اح افضل التطبيقات بهذا المجال',
    ),
    title: Text('جارس'),
    mainImage: Image.network(
      'https://static1.squarespace.com/static/51aff0bbe4b0aa90845e277c/54a5f1a7e4b0d132f65038a3/583650665016e15e71e9fd85/1494109307067/iphone-ipad-macbook.gif?format=1500w',
      height: 230.0,
      width: 230.0,
      alignment: Alignment.center,
    ),
    titleTextStyle: TextStyle(color: Colors.white),
    bodyTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 13),
  ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: null,
      iconColor: null,
      bubbleBackgroundColor: Colors.grey,
      body: Text(
        'ممتاز في الاداء',
      ),
      title: Text('الاداء'),
      mainImage: Image.network(
        'https://cdn.dribbble.com/users/1978751/screenshots/4452929/loader.gif',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(color: Colors.white),
      bodyTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    PageViewModel(
      pageColor: const Color(0xFF107D8B),
      iconImageAssetPath: null,
      iconColor: null,
      bubbleBackgroundColor: Colors.grey,
      body: Text(
        'دقه عالهه جدا',
      ),
      title: Text('دقه'),
      mainImage: Image.network(
        'https://i.pinimg.com/originals/f9/a8/73/f9a8736c48cdaf40d3b9c1721c6f5161.gif',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(color: Colors.white),
      bodyTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      bubble: Text('data'),
    )
  ] ;
    onDonePressed()async{
      SharedPreferences pref  = await SharedPreferences.getInstance();
      bool isshown = await pref.setBool('isShown', true);
      print(isshown);
      setState(() {
        this.isShown = isshown;
      });
    }

  @override
  Widget build(BuildContext context) {
    return isShown == true ? AddChartScreen() :  IntroViewsFlutter(
      pages,
      background: Colors.white,
      showSkipButton: false,
      doneText: Text('حسنا'),
      onTapDoneButton: onDonePressed,
    );
  }
}
