import 'package:scoped_model/scoped_model.dart';
import 'package:we_learning_dev/models/forum_model.dart';
import 'package:we_learning_dev/ui/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:we_learning_dev/ui/pages/forum/item_forum.dart';
import 'package:we_learning_dev/ui/widgets/custom_text.dart';
import 'package:we_learning_dev/ui/widgets/search_bar.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> with TickerProviderStateMixin {
  late AnimationController _animIconController;
  late AnimationController _animSideBarController;
  late Animation<double> animation;

  @override
  void initState() {
    _animIconController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animSideBarController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
    animation = Tween<double>(begin: 0, end: -210).animate(
        CurvedAnimation(parent: _animSideBarController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _animIconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ForumModel>(
      builder: (context, child, model) {
        return LayoutBuilder(
          builder: (context, constraints) => ListView(
            children: [
              Stack(
                children: [
                  sideBarForum(constraints, model),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Column(
                      children: [
                        SearchBar(hintText: 'Qual a sua dúvida?'),
                        const SizedBox(height: 32),
                        const ItemForum(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Transform sideBarForum(BoxConstraints constraints, ForumModel forumModel) {
    return Transform.translate(
      offset: Offset(
        animation.value,
        0,
      ),
      child: Container(
        width: 260,
        height: constraints.maxHeight,
        color: primaryWhite,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  forumModel.openCloseSideBar(
                      _animIconController, _animSideBarController);
                },
                child: AnimatedIcon(
                  progress: _animIconController,
                  icon: AnimatedIcons.arrow_menu,
                ),
              ),
            ),
            ItemMateria(forumModel: forumModel),
          ],
        ),
      ),
    );
  }
}

class ItemMateria extends StatelessWidget {
  ForumModel forumModel;
  ItemMateria({
    super.key,
    required this.forumModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: 'Matéria'),
        ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return item(index, forumModel, 4);
          },
        ),
      ],
    );
  }

  Widget item(int index, ForumModel forumModel, int itemCount) {
    List<String> titulosMateria = [
      'LMA',
      'POO',
      'HARE',
      'SOP',
    ];
    return Row(
      children: [
        CustomText(text: titulosMateria[index]),
        Spacer(),
        Checkbox(
          value: false,
          onChanged: (value) {
            forumModel.onClickChk(index, itemCount);
            print('click');
          },
        )
      ],
    );
  }
}
