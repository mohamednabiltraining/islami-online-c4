import 'package:flutter/material.dart';

import '../../main.dart';

class TasbehTab extends StatefulWidget {
  @override
  _TasbehTabState createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
  ];

  int counter = 0;
  int currentInex = 0;
  double rotate = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 85.0,
              ),
              Positioned(
                top: 4,
                right: size.width / 3,
                child: Image(
                  image: AssetImage('assets/images/head_seb7a.png'),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: onClick,
            splashColor: Color.fromRGBO(236, 236, 236, 1.0),
            customBorder: CircleBorder(),
            child: Transform.rotate(
              angle: rotate,
              child: Image.asset('assets/images/body_seb7a.png'),
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            'عدد التسبيحات',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 40.0),
          Container(
            width: 70.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: MyThemeData.primaryColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(
              child: Text(
                '$counter',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25.0),
          Container(
            width: 140.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: MyThemeData.primaryColor,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(
              child: Text(
                azkar[currentInex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onClick() {
    setState(() {
      rotate++;
      counter++;
    });
    if (counter == 34) {
      setState(() {
        currentInex++;
        counter = 0;
      });
      if (currentInex > azkar.length - 1) {
        setState(() {
          currentInex = 0;
        });
      }
    }
  }
}
