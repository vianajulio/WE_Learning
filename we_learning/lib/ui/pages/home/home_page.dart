import 'package:e_learning_dev/entitites/index_model.dart';
import 'package:e_learning_dev/ui/pages/forum/forum_page.dart';
import 'package:e_learning_dev/ui/pages/videoaula/videoaula_page.dart';
import 'package:e_learning_dev/ui/responsive/responsive.dart';
import 'package:e_learning_dev/ui/widgets/scaffold_basic.dart';
import 'package:e_learning_dev/ui/widgets/search_bar.dart';
import 'package:e_learning_dev/ui/widgets/carousel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    List<Widget> lista = [
      InkWell(
        onTap: () => Navigator.pushNamed(context, "/videoaula"),
        hoverColor: Colors.transparent,
        child: Container(
          color: Colors.red,
          margin: EdgeInsets.symmetric(horizontal: 24.0),
        ),
      ),
      InkWell(
        onTap: () => Navigator.pushNamed(context, "/forum"),
        hoverColor: Colors.transparent,
        child: Container(
          color: Colors.blue,
          margin: EdgeInsets.symmetric(horizontal: 24.0),
        ),
      ),
      InkWell(
        onTap: () => Navigator.pushNamed(context, "/videoaula"),
        hoverColor: Colors.transparent,
        child: Container(
          color: Colors.green,
          margin: EdgeInsets.symmetric(horizontal: 24.0),
        ),
      ),
      InkWell(
        onTap: () => Navigator.pushNamed(context, "/forum"),
        hoverColor: Colors.transparent,
        child: Container(
          color: Colors.pink,
          margin: EdgeInsets.symmetric(horizontal: 24.0),
        ),
      ),
      InkWell(
        onTap: () => Navigator.pushNamed(context, "/videoaula"),
        hoverColor: Colors.transparent,
        child: Container(
          color: Colors.orange,
          margin: EdgeInsets.symmetric(horizontal: 24.0),
        ),
      ),
    ];

    return ScaffoldBasic(
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          primary: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                responsiveLayout(
                  constraints,
                  SizedBox(
                    width: constraints.maxWidth * 1,
                    child: CustomCarosel(
                      listItens: lista,
                      width: constraints.maxWidth * 0.5,
                      height: constraints.maxHeight * 0.6,
                      autoPlay: true,
                    ),
                  ),
                  Container(),
                  Container(),
                ),
                SizedBox(height: constraints.maxHeight * 0.1),
                SearchBar(
                  hintText: "Qual matéria vamos estudar?",
                  altura: 48.0,
                  largura: 380.0,
                ),
                SizedBox(height: constraints.maxHeight * 0.1),
                CustomCarosel(
                  listItens: lista,
                  width: constraints.maxWidth * 0.8,
                  height: constraints.maxWidth * 0.2,
                  viewPortFraction: 0.4,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  padEnds: false,
                ),
                const SizedBox(height: 32),
                InkWell(
                  child: Text("Ver mais."),
                  onTap: () {
                    Navigator.pushNamed(context, '/videoaula');
                  },
                ),
                SizedBox(height: constraints.maxHeight * 0.2),
                Container(
                  width: double.infinity,
                  height: 180,
                  color: Color.fromARGB(255, 0, 128, 225),
                  child: const Center(
                    child: Text(
                      "Escola Senai Prof. Dr. Euryclides de Jesus Zerbini \n Av. da Saudade, 125 - Ponte Preta - Campinas/SP - CEP 13041-670 \n Telefone: (19) 3731-2840 | E-mail: senaizerbini@sp.senai.br",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
