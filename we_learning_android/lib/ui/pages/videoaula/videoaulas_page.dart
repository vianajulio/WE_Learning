import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/pages/videoaula/videoaula_page.dart';

class VideoaulasPage extends StatelessWidget {
  const VideoaulasPage({super.key});

  @override
  //Passar o id da catedoria clicada no InkWell
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          child: const Text('data'),
          onPressed: () {
<<<<<<< HEAD
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const VideoaulaPage(),
              ),
            );
=======
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => VideoaulaPage()));
>>>>>>> gabriel
          },
        ),
      ),
    );
  }
}
