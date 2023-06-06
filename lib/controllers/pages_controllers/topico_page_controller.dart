import 'dart:ui';

import 'package:get/get.dart';
import 'package:we_learning_android/repository/api/topico_api.dart';

class TopicoModel extends GetxController {
    var dropValue = 'Spam'.obs;

    updateDropValue(String? value){
        dropValue.value = value ?? "";
        update();
    }

    
 


}
