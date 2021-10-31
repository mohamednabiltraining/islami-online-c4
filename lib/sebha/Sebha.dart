import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_online_c4/main.dart';

class Sebha extends StatefulWidget {
  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int numberOfPraises = 0;
  String text = 'سبحان الله';
  int count = 1;

  int getNumerOfPraises() {
    if (numberOfPraises < 33) return numberOfPraises++;
    count++;
    if (count == 3) count = 0;
    return numberOfPraises = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/head of seb7a.png'),
          Image.asset('assets/images/body of seb7a.png'),
          SizedBox(
            height: 30,
          ),
          Text(
            'Number of praises',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color.fromRGBO(227, 186, 124, 1.0),
                width: 33,
              ),
            ),
            child: Text(
              '$numberOfPraises',
              style: TextStyle(
                  backgroundColor: Color.fromRGBO(227, 186, 124, 1.0),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: MyThemeData.primaryColor,
              minimumSize: const Size(200, 70),
              maximumSize: const Size(200, 70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () {
              getNumerOfPraises();
              if (count == 1)
                text = 'سبحان الله';
              else if (count == 2)
                text = 'الحمد لله';
              else
                text = 'الله واكبر';
              setState(() {});
            },
            child: Text(
              text,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
          )
        ],
      ),
    );
  }
}
