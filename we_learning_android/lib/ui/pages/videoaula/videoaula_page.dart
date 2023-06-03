import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/aula.dart';
import 'package:we_learning_android/repository/local/aulas_repository.dart';
import 'package:we_learning_android/repository/local/comentario_repository.dart';
import 'package:we_learning_android/ui/widgets/youtube_player.dart';

class VideoaulaPage extends StatefulWidget {
  //usar o id para gettar a lista de aula da api
  Aula? selected;
  VideoaulaPage({super.key, this.selected});

  @override
  State<VideoaulaPage> createState() => _VideoaulaPageState();
}

class _VideoaulaPageState extends State<VideoaulaPage> {
  final listaAulas = AulasRepository.aulas;
  @override
  void initState() {
    widget.selected = listaAulas[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final comentarios = ComentariosRepository.comentarios;
    int selected = 0;
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
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
                  widget.selected = listaAulas[index];
                  selected = index;
                  Navigator.pop(context);
                  setState(() {});
                },
              );
            },
            separatorBuilder: (__, _) => const Divider(),
            itemCount: listaAulas.length,
          ),
        ),
      ),
      appBar: AppBar(),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomYoutubePlayer(
                youtubeURL: widget.selected!.url.toString(),
                showFullScreenButton: true,
                showControls: true,
              ),
              /* e se as aulas ficassem na ordem dentro do player? */
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Container(
                    //decoration: BoxDecoration(),
                    //margin: EdgeInsets.all(10),
                    color: Colors.white24,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListTile(
                        title: Text("${widget.selected!.titulo}"),
                        subtitle:
                            Text('150 views ${widget.selected!.dateCadastro}'),
                        trailing: ElevatedButton(
                          child: const Text('Concluir'),
                          onPressed: () {
                            //fazer evento de alterar a aula assistida para true
                            listaAulas[selected].assistida = true;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //const Divider(color: Colors.black),
              Expanded(
                flex: 12,
                child: SizedBox(
                  child: Container(
                    color: Colors.white38,
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
