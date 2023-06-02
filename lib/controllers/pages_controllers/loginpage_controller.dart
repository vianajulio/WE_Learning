import 'package:get/get.dart';

class LoginPageController extends GetxController{
  var isLoading = false.obs;
  
  bool updateIsLoading(bool loading) {
    isLoading.value = !isLoading.value;
    loading = isLoading.value;
    update();
    return loading;
  }


}