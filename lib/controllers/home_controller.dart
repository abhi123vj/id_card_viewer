import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  increment() => count++;
  late FlipCardController controller;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
      controller = FlipCardController();

  }
}
