import 'package:store_app2/helper/api.dart';
import 'package:store_app2/models/product_model.dart';

class UpdateProductServices{
  Future<ProductModel> updateProduct({
    required String title,
    required String desc,
    required String price ,
    required String image,
    required String id ,
    required String category,

  })async{
    print('product id = $id');
    Map<String,dynamic> data= await Api().Put(url: 'https://fakestoreapi.com/products/$id', body:{
      'id':id,
      'title': title,
      'price': price,
      'description': desc,
      'image' : image,
      'category': category,
    },);
    return ProductModel.fromJson(data);


  }

}