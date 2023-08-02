import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarosel extends StatelessWidget {
  final List<Widget> listItens;
  final CarouselController? carouselController;
  final double? width;
  final double? height;
  final double viewPortFraction;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final int initialPage;
  final bool enableInfiniteScroll;
  final bool padEnds;
  final bool? sideArrow;

  CustomCarosel({
    super.key,
    this.carouselController,
    required this.listItens,
    this.width,
    this.height,
    this.viewPortFraction = 1,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 5),
    this.initialPage = 0,
    this.enableInfiniteScroll = true,
    this.padEnds = false,
    this.sideArrow = true,
  });

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    const double sizeValue = 48;
    const double iconSizeValue = 32;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Botão previousPage
        SizedBox(
          width: sizeValue,
          height: sizeValue,
          child: sideArrow != false
              ? IconButton(
                  icon: const Icon(
                    Icons.navigate_before,
                    size: iconSizeValue,
                  ),
                  hoverColor: Colors.transparent,
                  splashRadius: 1,
                  //Função resposável para trocar de página
                  onPressed: () => _controller.previousPage(),
                )
              : Container(),
        ),
        Flexible(
          child: CarouselSlider(
            items: listItens,
            options: CarouselOptions(
              //Define o tamanho do widget exibido de acordo com tamanho do carrossel
              viewportFraction: viewPortFraction,
              autoPlay: autoPlay,
              //Duração do intervalo da troca de widget
              autoPlayInterval: autoPlayInterval,
              initialPage: initialPage,
              enableInfiniteScroll: enableInfiniteScroll,
              padEnds: padEnds,
            ),
            //Controller é responsável pelas interações com o carrossel
            carouselController: _controller,
          ),
        ),
        //Botão nextPage
        SizedBox(
          width: sizeValue,
          height: sizeValue,
          child: sideArrow != false
              ? IconButton(
                  icon: const Icon(
                    Icons.navigate_next,
                    size: iconSizeValue,
                  ),
                  hoverColor: Colors.transparent,
                  splashRadius: 1,
                  //Função resposável para trocar de página
                  onPressed: () => _controller.nextPage(),
                )
              : Container(),
        ),
      ],
    );
  }
}
