import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  CustomButton({super.key,required this.text,required this.onTap});
  String  text;
  Function()?onTap ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 60,

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue,),
        alignment: Alignment.center,

        width: double.infinity,
        child: GestureDetector(

          onTap:onTap,
          child: Text(text,style: TextStyle(fontSize: 25,color: Colors.white,),
        ),
      ),
      ) );
  }
}
