import 'package:flutter/material.dart';
import 'package:islami_online_c4/main.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  List<String> DoaaData = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  var Counter = 0;
  var DoaaText = 'سبحان الله';
  double RotationAngle =0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            child: Text(
              'عدد التسبيحات',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 50,
            height: 80,
            decoration: BoxDecoration(
              color: MyThemeData.primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                Counter.toString(),
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
         Container(
            width: 180,
            height: 51,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: MyThemeData.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                DoaaText,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 75,
          ),
          Stack(
            alignment: Alignment(0.25, -2.1),
            children: [
              Container(
                width: 73,
                height: 105,
                child: Image.asset('assets/images/head_sebha.png'),
              ),
              Transform.rotate(
                angle: RotationAngle,
                child: Container(
                  width: 232,
                  height: 234,
                  child: IconButton(
                      onPressed: onSebhaClick,
                      icon: Image.asset(
                        ('assets/images/body_sebha.png'),
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  onSebhaClick() {
    RotationAngle++;
    Counter++;
    if (Counter == 0) {
      DoaaText = DoaaData[0];
      setState(() {});

    } else if (Counter == 33) {
      DoaaText = DoaaData[1];
      setState(() {});
    } else if (Counter == 66) {
      DoaaText = DoaaData[2];
      setState(() {});
    } else if (Counter == 99) {
      DoaaText = DoaaData[0];
      Counter = 0;
      setState(() {});
    }
    setState(() {});
  }
}
