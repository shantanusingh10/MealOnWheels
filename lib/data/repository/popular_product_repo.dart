import 'package:get/get.dart';
import 'package:meal_on_wheels/data/api/api_client.dart';

import '../../utils/app_constants.dart';
// GetxService to load data from internet
class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async{
    Response response = await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
    //print(response.statusText);
    return response;
  }
}
