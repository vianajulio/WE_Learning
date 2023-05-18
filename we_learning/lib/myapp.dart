import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:we_learning_dev/models/forum_model.dart';
import 'package:we_learning_dev/models/navigationModel.dart';
import 'package:we_learning_dev/ui/pages/forum/forum_page.dart';
import 'package:flutter/material.dart';
import 'package:we_learning_dev/ui/pages/home/home_page.dart';
import 'package:we_learning_dev/ui/pages/main_page.dart';
import 'package:we_learning_dev/ui/pages/videoaula/videoaula_page.dart';

//classe responsável por definir padrões de estilo para o projeto, como as cores
//mas também sendo possivel passar rotas de navegação
class MyApp extends StatelessWidget {
  NavigationModel navigationModel;
  ForumModel forumModel;
  MyApp(this.navigationModel, this.forumModel);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: forumModel,
      child: ScopedModel(
        model: navigationModel,
        child: MaterialApp(
          title: 'WE-Learning',
          theme: ThemeData(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            primarySwatch: Colors.blue,
          ),
          home: MainPage(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
