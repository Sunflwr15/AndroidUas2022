import 'package:get/get.dart';

class DetailBookController extends GetxController {
  //TODO: Implement DetailBookController

  final count = 0.obs;
  var toggle = true.obs as RxBool;
  @override
  void onClick() {
    toggle.value = !toggle.value;
  }

  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
