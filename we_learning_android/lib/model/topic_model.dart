import 'package:get/get.dart';
import 'package:we_learning_android/entities/topicoapp.dart';
import 'package:we_learning_android/repository/api/topico_api.dart';

class TopicModel extends GetxController{
  Future<List<TopicoApp>?>? futureTopics;

  @override
  onInit() async {
    await get();
  }
  
  get topics => futureTopics;

  Future<void> get() async {
    futureTopics = TopicoApi.instance.getAll();
  }

  Future<List<TopicoApp>?> futureTopicApp() async {
    return await futureTopics;
  }

}