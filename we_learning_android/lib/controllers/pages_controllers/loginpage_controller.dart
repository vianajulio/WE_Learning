import 'package:get/get.dart';

class LoginPageController extends GetxController {
  var isLoading = false.obs;
  bool btnAtv = true;

  bool updateIsLoading(bool loading) {
    isLoading.value = !isLoading.value;
    loading = isLoading.value;
    btnAtv = false;
    update();
    return loading;
  }

  onClickBtn() {
    btnAtv = !btnAtv;
    update();
    return btnAtv;
  }
}
