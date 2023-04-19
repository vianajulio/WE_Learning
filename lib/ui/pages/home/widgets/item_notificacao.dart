import 'package:flutter/material.dart';
import 'package:we_learning_dev/ui/color/colors.dart';

class ItemNotificacao extends StatelessWidget {
  const ItemNotificacao({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            children: [
              const CircleAvatar(
                child: Icon(
                  Icons.account_circle_outlined,
                  color: primaryWhite,
                  size: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Nome'),
                    Text('Titulo do tópico'),
                  ],
                ),
              ),
              Spacer(),
              const Text('Hora'),
            ],
          ),
        );
      },
      itemCount: 3,
    );
  }
}
