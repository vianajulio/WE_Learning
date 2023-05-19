import 'package:get/get.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/repository/api/topico_api.dart';

class TopicModel extends GetxController{
  Future<List<Topico>?>? futureTopics;

  @override
  onInit() async {
    super.onInit();
    await get();
  }
  
  get topics => futureTopics;

  Future<void> get() async {
    futureTopics = TopicoApi.instance.getAll();
  }

  Future<List<Topico>?> futureTopicApp() async {
    return await futureTopics;
  }

}