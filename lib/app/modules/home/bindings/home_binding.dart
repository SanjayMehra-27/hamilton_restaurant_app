import 'package:get/get.dart';

import '../../profile/controllers/profile_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<ProfileController>(ProfileController());
  }
}
