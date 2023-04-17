import 'package:we_learning_dev/ui/pages/forum/forum_page.dart';
import 'package:flutter/material.dart';
import 'package:we_learning_dev/ui/pages/home/home_page.dart';
import 'package:we_learning_dev/ui/pages/videoaula/videoaula_page.dart';

//classe responsável por definir padrões de estilo para o projeto, como as cores
//mas também sendo possivel passar rotas de navegação
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WE-Learning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/videoaula": (context) => const VideoAulaPage(),
        "/forum": (context) => const ForumPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
