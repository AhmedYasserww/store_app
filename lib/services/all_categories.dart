
import 'package:store_app2/helper/api.dart';
class AllCategoriesServices {

  Future<List<dynamic>> getAllCategories() async {

   List<dynamic> jsonData = await Api().get(url: 'https://fakestoreapi.com/products/categories');

      return jsonData;
    }

  }
