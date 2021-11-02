import 'package:flutter/material.dart';
import 'package:islami_online_c4/main.dart';

class TasbehTab extends StatefulWidget {
  @override
  _TasbehTabState createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter=0;

  List<String> tsabeh=['الحمدلله',' سبحان الله','الله اكبر '];
  double angle=0;
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
               Container(
                   margin: EdgeInsets.only(left:MediaQuery.of(context).size.height*.08 ),
                   child: Image.asset('assets/images/seb7a_head.png')),
               InkWell(
                 onTap: onSebhaPressed,
                 child: Container(
                 //  color: Colors.red,
                     margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.09),
                     child: Transform.rotate(
                         angle: angle,
                         child: Image.asset('assets/images/seb7a_body.png'))),
               )
            ],
          ),
          SizedBox(height: 8,),
          Text('عدد التسبيحات',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
          Container(
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color:Color(0xffB7935F,),
            ),
              padding: EdgeInsets.all(18),
              child: Text('$counter',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
          Container(
            margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color:Theme.of(context).primaryColor,),

              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
              child: Text('${tsabeh[index]}',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold))),

        ],
      ),
    );
  }

  void onSebhaPressed(){
    counter++;
    if(counter%33==0){
      if(index==tsabeh.length-1){
        index=0;
      }
      index++;
    }
    setState(() {
    angle+=20;
    });
  }
}
