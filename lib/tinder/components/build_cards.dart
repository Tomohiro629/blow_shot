import 'package:blow_shot/tinder/components/swiped_card.dart';
import 'package:blow_shot/tinder/swiped_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildCards extends ConsumerWidget {
  const BuildCards({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(swipedViewModel);
    final urlImages = viewModel.urlImages;

    return urlImages.isEmpty
        ? Center(
            child: MaterialButton(
              child: const Text("りすたーと"),
              onPressed: () {
                viewModel.resetUsers();
              },
            ),
          )
        : Stack(
            children: urlImages
                .map((urlImage) => SwaipedCard(
                    urlImage: urlImage, isFront: urlImages.last == urlImage))
                .toList(),
          );
  }
}
