import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:store_app2/models/product_model.dart';
import 'package:store_app2/screens/home_page.dart';
import 'package:store_app2/screens/update_product_page.dart';
import 'package:store_app2/services/get_all_product_services.dart';
void main()
{
  runApp( const MyApp());
}
/*async {
  WidgetsFlutterBinding.ensureInitialized();

  // Fetching data from API
  List<ProductModel> products = await AllProductServices().getAllProduct();

  // Printing data to console
  for (var product in products) {
    print('Product ID: ${product.id}');
    print('Product Title: ${product.title}');
    print('Product Description: ${product.description}');
    print('Product Price: ${product.price}');
    print('Product Image URL: ${product.image}');
    print('----------------------');
  }

  // You can continue your app setup here
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

     /* theme: ThemeData(

        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue),

      ),*/
      home:  const HomePage(),

      routes: {
        "HomePage":(context)=>const HomePage(),
        "updateProduct":(context)=>UpdateProductPage()
      },
    );
  }
}


