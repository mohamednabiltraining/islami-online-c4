import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TasbehTabData.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  int index = 0;

  List<TasbehTabData> Data = [
    TasbehTabData('سبحان الله'),
    TasbehTabData('الحمد لله'),
    TasbehTabData('الله اكبر'),
    TasbehTabData('لا حول ولا قوة الا بالله'),
    TasbehTabData('لا اله الا الله'),
    TasbehTabData('اللهم صلي وسلم علي سيدنا محمد'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(
            flex: 3,
          ),
          Transform.rotate(
            angle: counter.toDouble(),
            child: Stack(
              alignment: Alignment(.4, -2.2),
              children: [
                Image.asset('assets/images/head_of_seb7a.png'),
                Image.asset('assets/images/body_of_seb7a.png'),
              ],
            ),
          ),
          Text(
            'عدد التسبيحات',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(183, 147, 95, 100),
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 69,
            height: 81,
            child: Center(
                child: Text(
              '$counter',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            )),
          ),
          Container(
            height: 51,
            width: 137,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  buttonaction();
                });
              },
              child: Text(
                Data[index].text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(183, 147, 95, 100)),
              ),
            ),
          ),
          Spacer(
            flex: 4,
          ),
        ],
      ),
    ));
  }

  buttonaction() {
    if (counter != 34) {
      counter = counter + 1;
    }
    if (counter == 34) {
      index = index + 1;
      counter = counter - 34;
      if (index > Data.length - 1) {
        return index = 0;
      }
    }
  }
}
