import 'dart:math';

import 'package:blow_shot/tinder/components/build_card.dart';
import 'package:blow_shot/tinder/swiped_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FrontBuildCard extends ConsumerWidget {
  const FrontBuildCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(swipedViewModel);
    return GestureDetector(
      child: LayoutBuilder(builder: (context, constraints) {
        final position = viewModel.position;
        final millisconds = viewModel.isDragging ? 0 : 400;

        return AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: millisconds),
          transform: Matrix4.identity()..translate(position.dx, position.dy),
          child: BuildCard(
            urlImage: viewModel.urlImages.last,
          ),
        );
      }),
      onPanStart: (details) {
        viewModel.startPosition(details);
      },
      onPanUpdate: (details) {
        viewModel.updatePositon(details);
      },
      onPanEnd: (details) {
        viewModel.endPosition();
      },
    );
  }
}
