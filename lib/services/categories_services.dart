import 'package:store_app2/helper/api.dart';
import 'package:store_app2/models/product_model.dart';

class CategoriesServices {

  Future<List<ProductModel>> getCategoriesProducts({required String categoryName}) async {

    List<dynamic> jsonData=await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');

      List<ProductModel> productList = [];
      for (var i = 0; i <= jsonData.length; i++) {
        productList.add(ProductModel.fromJson(jsonData[i]));
      }
      return productList;
    }
  }
