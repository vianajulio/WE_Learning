import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/custom_widgets/scaffold_custom.dart';

import '../../../repository/local/aulas_repository.dart';
import '../../../repository/local/comentario_repository.dart';

class VideoAulaPage extends StatefulWidget {
  const VideoAulaPage({super.key});

  @override
  State<VideoAulaPage> createState() => _VideoAulaPageState();
}

class _VideoAulaPageState extends State<VideoAulaPage> {
  @override
  Widget build(BuildContext context) {
    final comentarios = ComentariosRepository.comentarios;
    return ScaffoldCustom(
      drawer: SafeArea(
        child: Drawer(
          child: ListView.separated(
            itemCount: AulasRepository.aulas.length,
            separatorBuilder: (__, _) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(AulasRepository.aulas[index].titulo.toString()),
                trailing: AulasRepository.aulas[index].assistida!
                    ? const Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : null,
                onTap: () {
                  print('idAula: ${AulasRepository.aulas[index].id}');
                },
              );
            },
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close))
      ],
      endDrawer: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black54,
            width: double.infinity,
            height: 240,
          ),
          /* e se as aulas ficassem na ordem dentro do player? */
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: ListTile(
                title: const Text('Aula'),
                subtitle: const Text('150 views 10/10/2022'),
                trailing: ElevatedButton(
                  child: const Text('Concluir'),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            flex: 12,
            child: ListView.separated(
              separatorBuilder: (__, _) => const Divider(),
              itemCount: comentarios.length,
              itemBuilder: (context, index) {
                return ListTile(
                  enableFeedback: true,
                  splashColor: Colors.red[200],
                  onTap: () {},
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text('${comentarios[index].assunto}'),
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(Icons.person),
                      Text('${comentarios[index].nome}')
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
