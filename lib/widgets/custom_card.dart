import 'package:flutter/material.dart';
import 'package:store_app2/models/product_model.dart';
class CustomCard extends StatelessWidget {
  const CustomCard({super.key,required this.product});
 final ProductModel product ;

  @override
  Widget build(BuildContext context) {
    //دى علشان اطبع اول كلمتين من الاسترنج
    List<String> words = product.title.split(' ');
    // Take the first two words
    String firstTwoWords =
    words.length >= 2 ? '${words[0]} ${words[1]}' : product.title;

    return InkWell(
      onTap:(){
        Navigator.pushNamed(context,"updateProduct",arguments:product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(

            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40, // مدى حده الشادو او الحواف
                  color: Colors.grey.withOpacity(.5),
                  spreadRadius: 0,//الشادو هيتحرك قد اي مسافه
                  offset: const Offset(10,10)//ابعاد الشادو

              )
            ]),
            height: 150,
            width: 220,
            child:
            Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(firstTwoWords,style: TextStyle(color:Colors.grey,fontSize:20),),
                    const SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$''${product.price.toString()}'),
                        Icon(Icons.favorite,color: Colors.red,)
                      ],)
                  ],),
              ),
            ),

          ),
          Positioned(
              top : -60,
              right:25,
              child: Image(image:NetworkImage(product.image,),height: 120,width:100,)),


        ],
      ),
    );
  }
}
