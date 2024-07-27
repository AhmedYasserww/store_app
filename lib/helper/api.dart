import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Api{
  Future<dynamic> get({required String url,@required String? token})async{
    Map<String,dynamic> headers ={};
    if(token!=null)
    {
      headers.addAll({
        'Authorization' :'Bearer $token'
      });//add all دى معناها انو هيضيف ماب
    }
    final dio = Dio();
    Response response = await dio.get(url,options: Options(headers: headers));
    if(response.statusCode==200){
      return response.data;
    }
    else {
      throw Exception('there is an Exception in status ${response.statusCode} with body ${response.data}');
    }

  }
  Future<dynamic> post({required String url,@required dynamic body,@required String?token})async{

    Map<String,String> headers ={};
    if(token!=null)
      {
        headers.addAll({
          'Authorization' :'Bearer $token'
        });//add all دى معناها انو هيضيف ماب
      }
    final  dio = Dio();
    Response response = await dio.post(url,
     data:body,
      options: Options(
        headers: headers
      )
    );
    if(response.statusCode==200) {
      return response.data;
    }

    else {
    throw Exception('there is an Exception in status ${response.statusCode} with body ${response.data}');
    }
  }

  Future<dynamic> Put({required String url,@required dynamic body,@required String?token})async{

    Map<String,String> headers ={};
    headers.addAll(
      {
        'Content-Type':'application/x-www-form-urlencoded'
      }
    );
    if(token!=null)
    {
      headers.addAll({
        'Authorization' :'Bearer $token'
      });//add all دى معناها انو هيضيف ماب
    }
    final  dio = Dio();
    print('url = $url , body =$body , token=$token');
    Response response = await dio.post(url,
        data:body,
        options: Options(
            headers: headers
        )
    );
    if(response.statusCode==200) {
      Map<String,dynamic> data =response.data;
      print(data);
      return data;
    }

    else {
      throw Exception('there is an Exception in status ${response.statusCode} with body ${response.data}');
    }
  }
}
//هنا معظم الهيدر بيكون ثابت مبيكونش فيه تغيير غير فى التوكن بس علشان الصلاحيه
//@required دى معناها انها اوبشينال ممكن اليوزر يديهالى او لا