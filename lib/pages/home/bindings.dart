import 'package:get/get.dart';
import 'package:test_error/pages/home/controller.dart';


class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}