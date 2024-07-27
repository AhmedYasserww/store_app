import '../models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:store_app2/helper/api.dart';
class AllProductServices
{
  Future<List<ProductModel>> getAllProduct()async {
 List<dynamic> jsonData=await Api().get(url: 'https://fakestoreapi.com/products');

      List<ProductModel> productList = [];
      for (var i = 0; i < jsonData.length; i++) {
        productList.add(ProductModel.fromJson(jsonData[i]));
      }
      return productList;
    }
  }
