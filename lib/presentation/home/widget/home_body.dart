import 'package:flutter/material.dart';
import 'package:practice/presentation/common/show_overlay_image.dart';
import 'package:practice/presentation/home/widget/home_body_card.dart';

import '../../../domain/model/home_card_model.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key, required this.cardList });

  List<HomeCardModel> cardList;

  @override
  Widget build(BuildContext context) {
    ShowOverlayImage showOverlayImage = ShowOverlayImage(context: context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cardList.length,
      itemBuilder: (context, index) {
        return HomeBodyCard(
          homeCardModel: cardList[index],
          onLongPress: () => showOverlayImage.showOverlayImage(
            image: cardList[index].image,
          ),
          onLongPressEnd: () => showOverlayImage.closeOverlay(),
        );
      },
    );
  }
}
