import 'package:get/get.dart';
import 'package:meal_on_wheels/data/api/api_client.dart';
// GetxService to load data from internet
class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async{
    return await apiClient.getData("end point url");
  }
}