class ProductModel {
  final String id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating ;

  ProductModel({required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });


  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'].toString(),
      title: jsonData['title'] ,
      price: (jsonData['price'] as num).toDouble(),
      description: jsonData['description'] as String,
      category: jsonData['category'] as String,
      image: jsonData['image'] as String,
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }


}
class RatingModel{
  final double rate;
  final int count ;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] as num).toDouble(),
      count: jsonData['count'] as int,
    );
  }

}