import 'package:flutter/material.dart';

Color buttonsColor(keyName){
  if(keyName == "AC" || keyName == "+/-" || keyName == "%"){
    return Color(0xffA6A6A6);
  }
  else if( keyName == "÷" || keyName == "x" || keyName == "-" || keyName == "+" || keyName == "="){
    return Color(0xffF89101);
  }
  else{
    return Color(0xff333333);
  }
}