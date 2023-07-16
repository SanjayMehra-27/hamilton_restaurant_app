import 'package:get/get.dart';
import 'package:restaurant_app/app/data/enums/utils/rest_apis/rest_client.dart';
import 'package:restaurant_app/app/models/restaurant_model.dart';

class HomeController extends GetxController {
  final isDrawerOpen = false.obs;
  final restaurants = <RestaurantModel>[].obs;
  final isLoading = false.obs;

  final selectedRestaurantType = 1.obs;
  final restaurantType = 1.obs;

  RestClient restClient = RestClient();

  @override
  void onInit() {
    super.onInit();
    getRestaurants();
  }

  // get restaurants
  Future<void> getRestaurants() async {
    try {
      isLoading.value = true;
      restaurants.clear();
      await restClient
          .getRestaurants(
        restaurantType: selectedRestaurantType.value,
      )
          .then((value) {
        restaurants.value = value;
        isLoading.value = false;
      });
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}
