import 'package:get/get.dart';
import 'package:meal_on_wheels/data/repository/popular_product_repo.dart';

import '../data/repository/recommended_product_repo.dart';
import '../models/products_model.dart';

class RecommendedProductController extends GetxController{
  final PopularProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getPopularProductList();
    //print("trying");
    if(response.statusCode == 200){

      print("got products");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{
      print(response.statusCode);
      print("not getting");
    }
  }
}