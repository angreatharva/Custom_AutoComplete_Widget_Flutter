import 'package:get/get.dart';

class MyController extends GetxController {
  // Observable variable
  RxString name = "".obs;

  void updateName(String newName) {
    name.value = newName;
  }
}
