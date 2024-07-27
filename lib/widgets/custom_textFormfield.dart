import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,this.hintText,this.onChange,this.inputType});
  String ? hintText;
  Function (String)? onChange;
  TextInputType ? inputType;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType:inputType,
       onChanged: onChange,
          decoration:InputDecoration(
            hintText: hintText,
             // hintStyle:const TextStyle(color: Colors.white54,fontSize: 20),
              enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black,width:1.5),
                borderRadius: BorderRadius.circular(10),

              ),
             border: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.circular(15)


              )
          )
      ),
    );

  }
}
