import 'package:flutter/material.dart';
import 'package:store_app2/models/product_model.dart';
class CustomCard extends StatelessWidget {
  const CustomCard({super.key,required this.product});
 final ProductModel product ;

  @override
  Widget build(BuildContext context) {
    List<String> words = product.title.split(' ');
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
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(.5),
                  spreadRadius: 0,
                  offset: const Offset(10,10)

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
                    Text(firstTwoWords,style: const TextStyle(color:Colors.grey,fontSize:20),),
                    const SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$''${product.price.toString()}'),
                        const Icon(Icons.favorite,color: Colors.red,)
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
