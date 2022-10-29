
import 'package:get/get.dart';
import '../model/register_model.dart';
import '../service/register_service.dart';

class registerViewModel extends GetxController {
  final IregisterService registerService;
  registerViewModel(this.registerService);

  var counter = 0.obs;
  var isLoading = false.obs;
  var registerList = <registerModel>[].obs;
  

  void increaseCounter() => counter++;

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> getregisterItems() async {
    changeLoading();

    final response = await registerService.fetchregisterItems();

    //this response handle algo can be better than
    if (response.isNotEmpty) {
      registerList.value = response;
      Get.snackbar("Success", 'You have items !',);
    } else {
      Get.snackbar('Error', 'Some errors happened OR There is no item !');
    }

    changeLoading();
  }
}
