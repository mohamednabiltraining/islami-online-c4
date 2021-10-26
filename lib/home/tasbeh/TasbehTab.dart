import 'package:flutter/material.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {

  int Number_Tasbeh =0;

  int index=0;

  List<String> tasbeh_String=[
    'سبحان اللًه',
    'الحمدلله',
    ' لا اله الا اللًه',
    'اللًه اكبر',
  ];
  double rotateValue=0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
             alignment: AlignmentDirectional.topCenter,
            children: [
              Image.asset('assets/images/head of seb7a.png',) ,
              Container(
                margin: EdgeInsets.only(top: 75),
                child: Transform.rotate(
                  angle: rotateValue,
                  child: ClipOval(
                    child: FlatButton(

                      splashColor: Colors.transparent,

                      padding: EdgeInsets.all(0.0),
                      onPressed:()=> onPressed_tasbeh(),
                      child:Image.asset('assets/images/body of seb7a.png') ,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 30,),

          Text('عدد التسبيحات',
            style:TextStyle(
                fontSize: 25
            ) ,
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
                color:  Color(0xFFC7B295),
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10))
            ),
            child: Text('$Number_Tasbeh'),
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.all(5),
            width: 160,
            // height: 50,
            decoration:  BoxDecoration(
                color: Color(0xFFB7935F),

                borderRadius: BorderRadius.circular(20)
            ),
            child: Text('${tasbeh_String[index]}',textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
          ),
        ],

      ),
    );
  }

  void onPressed_tasbeh(){
    if(Number_Tasbeh<=31){
      Number_Tasbeh++;
    }
    if(Number_Tasbeh==31&&index<=3){
      Number_Tasbeh=0;
      index++;
    }if(index==3){
      index=0;

    }
    rotateValue++;


    tasbeh_String[index];




    setState(() {

    });


  }
}
