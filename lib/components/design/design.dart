import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

setOutlineBorder(borderSide, borderRadius)  {

  return OutlineInputBorder(
    borderSide: BorderSide(width: borderSide, color: APPCOLOR),
    borderRadius: BorderRadius.circular(borderRadius),
  );

}

setOutlineBorderSearch(borderSide, borderRadius)  {

  return OutlineInputBorder(

    borderSide: BorderSide(width: borderSide, color: APPCOLOR2, ),
    borderRadius: BorderRadius.circular(borderRadius),
  );

}



setUnderlineBorder(borderSide, borderRadius)  {

  return UnderlineInputBorder(
    borderSide: BorderSide(width: borderSide, color: APPCOLOR),
    borderRadius: BorderRadius.circular(borderRadius),
  );

}

setUnderlineBorderColor(borderSide, borderRadius,color)  {

  return UnderlineInputBorder(
    borderSide: BorderSide(width: borderSide, color: color),
    borderRadius: BorderRadius.circular(borderRadius),
  );

}

setUnderlineBorderError(borderSide, borderRadius)  {

  return UnderlineInputBorder(
    borderSide: BorderSide(width: borderSide, color: APPCOLOR),
    borderRadius: BorderRadius.circular(borderRadius),
  );

}
BaseButtonRoundedColor(double width, double height,color){
  return  ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(width,height)),

      backgroundColor: MaterialStateProperty.all(color),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: color)
          )
      ));
}

BaseButtonRoundedColorBorder(double width, double height,color, border){
  return  ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(width,height)),

      backgroundColor: MaterialStateProperty.all(color),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(border),
              side: BorderSide(color: color)
          )
      ));
}

BaseButtonSize(double width, double height,color){
  return  ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(width,height)),

      backgroundColor: MaterialStateProperty.all(color),
     );
}

const APPCOLOR = Colors.lightGreen;
const APPCOLOR2 = Colors.redAccent;
final APPCOLOR3 = Colors.lightGreen.shade50;
const APPCOLOR4 = Color(0xff044343);


const APPtextStyleHeader = TextStyle(fontWeight: FontWeight.bold, fontSize: 30,);
BoxGradient(){
  return BoxDecoration(
    gradient: LinearGradient(
        colors: [APPCOLOR, Colors.blueAccent.shade700, Colors.indigo]), );
}

