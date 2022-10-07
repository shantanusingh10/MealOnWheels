import 'package:get/get.dart';
import 'package:meal_on_wheels/data/api/api_client.dart';

import '../../utils/app_constants.dart';
// GetxService to load data from internet
class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});
  Future<Response> getRecommendedProductList() async{
    Response response = await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
    //print(response.statusText);
    return response;
  }
}
