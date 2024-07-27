import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app2/models/product_model.dart';
import 'package:store_app2/services/get_all_product_services.dart';
import 'package:store_app2/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: const Text("New Trend"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 60, left: 16, right: 16),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductServices().getAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 60,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, i) {
                  return CustomCard(product: products[i],);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
