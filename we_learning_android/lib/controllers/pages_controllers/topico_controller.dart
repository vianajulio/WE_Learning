import 'package:get/get.dart';

class TopicoModel extends GetxController {
    var dropValue = 'Spam'.obs;

    updateDropValue(String? value){
        dropValue.value = value ?? "";
        update();
    }



}
