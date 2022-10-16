import 'package:flutter/material.dart';

class PageBackGround extends StatelessWidget {
  const PageBackGround({
    super.key,
    required this.page,
    required this.colors,
  });
  final Widget page;
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colors)),
        child: page);
  }
}
