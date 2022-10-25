import 'package:blow_shot/tinder/components/build_card.dart';
import 'package:blow_shot/tinder/components/front_build_card.dart';
import 'package:blow_shot/tinder/swiped_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwaipedCard extends ConsumerWidget {
  const SwaipedCard({super.key, required this.isFront, required this.urlImage});
  final String urlImage;
  final bool isFront;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(swipedViewModel);
    final size = MediaQuery.of(context).size;

    viewModel.setScreenSize(size);

    return Scaffold(
      body: SizedBox.expand(
          child: isFront
              ? const FrontBuildCard()
              : BuildCard(
                  urlImage: urlImage,
                )),
    );
  }
}
