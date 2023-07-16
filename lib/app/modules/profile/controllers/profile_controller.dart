import 'package:get/get.dart';
import 'package:restaurant_app/app/data/enums/utils/rest_apis/rest_client.dart';
import 'package:restaurant_app/app/models/user_profile_model.dart';

class ProfileController extends GetxController {
  final userProfile = UserProfileModel().obs;
  final isLoading = false.obs;

  RestClient restClient = RestClient();

  @override
  Future<void> onInit() async {
    await getUserProfile();
    super.onInit();
  }

  // Get User Profile
  Future<void> getUserProfile() async {
    isLoading.value = true;
    userProfile.value = await restClient.getUserProfile();
    isLoading.value = false;
  }
}
