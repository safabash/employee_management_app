import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:get/get.dart';

class SnackbarUtil {
  static void showErrorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorManagerLight.scaffoldBgColor,
      colorText: ColorManagerLight.redColor,
    );
  }

  static void showSuccessSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorManagerLight.greenColor,
      colorText: ColorManagerLight.scaffoldBgColor,
    );
  }
}
