import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/category.dart';

class CardCategoria extends StatelessWidget {
  Category categoria;
  var icon;
  CardCategoria({super.key, required this.categoria, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 50.0, color: Colors.red),
            SizedBox(height: 15),
            Text('${categoria.name}'),
          ],
        ),
      ),
    );
  }
}
