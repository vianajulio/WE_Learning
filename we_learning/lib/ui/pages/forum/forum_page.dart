import 'package:e_learning_dev/ui/color/colors.dart';
import 'package:e_learning_dev/ui/pages/forum/widgets/sidebar.dart';
import 'package:e_learning_dev/ui/responsive/responsive.dart';
import 'package:e_learning_dev/ui/widgets/custom_text.dart';
import 'package:e_learning_dev/ui/widgets/scaffold_basic.dart';
import 'package:e_learning_dev/ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_dev/ui/pages/forum/widgets/materia.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage>
    with SingleTickerProviderStateMixin {
  bool _showSideBar = false;
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBasic(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(animation.value * -200, 0),
                  child: Sidebar(
                    constraints: constraints,
                    showSidebar: _showSideBar,
                    setState: () {
                      setState(
                        () {
                          _showSideBar = !_showSideBar;
                          if (_showSideBar) {
                            _animationController.forward();
                          } else {
                            _animationController.reverse();
                          }
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60, bottom: 40),
                        child: SearchBar(
                          hintText: 'Qual é a sua dúvida?',
                          largura: constraints.maxWidth / 2,
                        ),
                      ),
                      SingleChildScrollView(
                        child: topico(constraints),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showSideBar = !_showSideBar;
            if (_showSideBar) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
          });
        },
      ),
    );
  }
}

Widget topico(BoxConstraints constraints) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 16, top: 16),
        width: constraints.maxWidth / 2,
        height: 100,
        color: tertiaryBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    CustomText(
                      text: 'Titulo',
                      color: primaryWhite,
                    ),
                    CustomText(
                      text: 'Autor',
                      color: secondaryWhite,
                    )
                  ],
                ),
              ],
            ),
            CustomText(
              text: 'Quantidade de respostas',
              color: secondaryWhite,
            )
          ],
        ),
      ),
      Container(
        width: constraints.maxWidth / 2,
        height: 60,
        color: secondaryBlue,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: CustomText(
          text: 'Resposta mais votada',
          color: primaryWhite,
        ),
      ),
    ],
  );
}
