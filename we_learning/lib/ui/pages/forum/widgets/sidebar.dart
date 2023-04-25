import 'package:e_learning_dev/ui/pages/forum/widgets/materia.dart';
import 'package:e_learning_dev/ui/responsive/responsive.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  BoxConstraints constraints;
  bool showSidebar;
  VoidCallback setState;
  Sidebar(
      {super.key,
      required this.constraints,
      required this.showSidebar,
      required this.setState});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return responsiveLayout(
      widget.constraints,
      Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white70,
                  width: 240,
                  child: widget.showSidebar
                      ? Container()
                      : ListView(
                          children: const [
                            SizedBox(height: 140),
                            Materia(),
                            Materia(),
                            Materia(),
                            Materia(),
                          ],
                        ),
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(205, 20),
            child: InkWell(
              onTap: widget.setState,
              child: widget.showSidebar
                  ? Icon(Icons.arrow_forward_ios)
                  : Icon(Icons.arrow_back_ios),
            ),
          ),
        ],
      ),
      Column(),
      Container(),
    );
  }
}
