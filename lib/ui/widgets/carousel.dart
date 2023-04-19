import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarosel extends StatefulWidget {
  List<Widget> listItens;
  CarouselController? carouselController;
  double? width;
  double? height;
  double viewPortFraction;
  bool autoPlay;
  Duration autoPlayInterval;
  bool enableInfiniteScroll;
  int initialPage;
  bool padEnds;

  CustomCarosel({
    super.key,
    this.carouselController,
    required this.listItens,
    this.width,
    this.height,
    this.viewPortFraction = 1,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 5),
    this.enableInfiniteScroll = true,
    this.initialPage = 1,
    this.padEnds = true,
  });

  @override
  State<CustomCarosel> createState() => _CustomCaroselState();
}

class _CustomCaroselState extends State<CustomCarosel> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Botão previousPage
        SizedBox(
          width: 60,
          height: 60,
          child: IconButton(
            icon: const Icon(
              Icons.navigate_before,
              size: 48,
            ),
            hoverColor: Colors.transparent,
            splashRadius: 1,
            //Função resposável para trocar de página
            onPressed: () => _controller.previousPage(),
          ),
        ),
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: CarouselSlider(
            items: widget.listItens,
            options: CarouselOptions(
              //Define o tamanho do widget exibido de acordo com tamanho do carrossel
              viewportFraction: widget.viewPortFraction,
              autoPlay: widget.autoPlay,
              //Duração do intervalo da troca de widget
              autoPlayInterval: widget.autoPlayInterval,
              enableInfiniteScroll: widget.enableInfiniteScroll,
              initialPage: widget.initialPage,
              //adiciona um padding no final do scroll, para o widget ficar no centro
              padEnds: widget.padEnds,
            ),
            //Controller é responsável pelas interações com o carrossel
            carouselController: _controller,
          ),
        ),
        //Botão nextPage
        SizedBox(
          width: 60,
          height: 60,
          child: IconButton(
            icon: const Icon(
              Icons.navigate_next,
              size: 48,
            ),
            hoverColor: Colors.transparent,
            splashRadius: 1,
            //Função resposável para trocar de página
            onPressed: () => _controller.nextPage(),
          ),
        ),
      ],
    );
  }
}
