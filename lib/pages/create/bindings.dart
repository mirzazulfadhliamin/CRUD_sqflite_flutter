import 'package:get/get.dart';
import 'package:test_error/pages/create/controller.dart';



class CreateBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateController());
  }
}