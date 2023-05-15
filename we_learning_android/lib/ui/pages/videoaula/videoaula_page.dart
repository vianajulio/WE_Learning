import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:we_learning_android/repository/aulas_repository.dart';
import 'package:we_learning_android/repository/comentario_repository.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';

class VideoAulaPage extends StatelessWidget {
  const VideoAulaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final comentarios = ComentariosRepository.comentarios;
    final listaAulas = AulasRepository.aulas;
    return Scaffold(
      drawer: Drawer( 
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listaAulas[index].titulo.toString()),
                  trailing: listaAulas[index].assistida!
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : null,
                  onTap: () {
                    print('idAula: ${listaAulas[index].id}');
                  },
                );
              },
              separatorBuilder: (__, _) => const Divider(),
              itemCount: listaAulas.length)),
      appBar: AppBar(),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: SizedBox(
                  child: Container(
                    color: Colors.amber,
                  ),
                ),
              ),
              /* e se as aulas ficassem na ordem dentro do player? */
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Container(
                    //margin: EdgeInsets.all(10),
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListTile(
                        title: const Text('Aula Foda'),
                        subtitle: const Text('150 views 10/10/2022'),
                        trailing: ElevatedButton(
                          child: const Text('Concluir'),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 12,
                child: SizedBox(
                  child: Container(
                    color: Colors.blue,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: ListTile(
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
                          ),
                        );
                      },
                      separatorBuilder: (__, _) => const Divider(),
                      itemCount: comentarios.length,
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
