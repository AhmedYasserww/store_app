import 'package:flutter/material.dart';
import 'package:store_app2/models/product_model.dart';
import 'package:store_app2/services/update_product_service.dart';
import 'package:store_app2/widgets/custom_botton.dart';
import 'package:store_app2/widgets/custom_textFormfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
   UpdateProductPage({super.key});
  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
String? productName , image ,desc;
double ? price ;
bool isLoading = false;
late ProductModel product; // Declare product here


  @override
  Widget build(BuildContext context) {
     product= ModalRoute.of(context)!.settings.arguments as ProductModel;


    return ModalProgressHUD(
      inAsyncCall:isLoading ,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          //backgroundColor: Colors.transparent,
          title: Text("Update product"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,),
              CustomTextField(
                onChange:(data){
                  productName =data;
                },
                hintText:"Product Name",
              ),
              CustomTextField(
                onChange:(data){
                  desc =data;
                },
                hintText:"description",
              ),
              CustomTextField(
                inputType: TextInputType.number,
                hintText:"Price",
                onChange: (data){
                  price = double.tryParse(data);
                },
              ),
              CustomTextField(
                hintText:"image",
                onChange: (data){
                  image =data;
                },
              ),
              const SizedBox(height: 10,),
              CustomButton(text:"Update",onTap: () async{
                isLoading=true;
                setState(() {

                });
                try {
                 await updateProduct(product);
                  print("success");
                }  catch (e) {
                  print(e.toString());
                }
                isLoading = false;
                setState(() {

                });

              },)
            ],
          ),
        ),
      ),
    );
  }

 Future <void> updateProduct(ProductModel Product) async{

    await  UpdateProductServices().updateProduct(
      id: product.id,
          title:productName == null ? product.title : productName!,
          desc: desc == null ? product.description : desc!,
          price: price == null ? product.price.toString() : price.toString(),
          image: image == null ? product.image : image!,
          category: product.category
      );
  }
}
