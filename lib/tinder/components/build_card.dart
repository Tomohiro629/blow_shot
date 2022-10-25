import 'package:blow_shot/tinder/swiped_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildCard extends ConsumerWidget {
  const BuildCard({super.key, required this.urlImage});
  final String urlImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(swipedViewModel);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(urlImage),
                fit: BoxFit.cover,
              ),
            )),
            // SizedBox(
            //   width: 250.0,
            //   height: 150.0,
            //   child: Text(
            //     viewModel.text,
            //     textAlign: viewModel.text == "next"
            //         ? TextAlign.right
            //         : TextAlign.right,
            //     style: TextStyle(fontSize: 50.0),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
