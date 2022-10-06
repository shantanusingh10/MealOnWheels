import 'package:get/get.dart';
import 'package:meal_on_wheels/data/repository/popular_product_repo.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    //print("trying");
    if(response.statusCode == 200){
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      update();
    }else{
      print(response.statusCode);
      print("not getting");
    }
  }
}