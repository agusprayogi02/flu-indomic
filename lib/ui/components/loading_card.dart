import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    Key? key,
    this.height = 100,
    this.width = 100,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Image.asset('assets/gif/spinner.gif'),
          ),
          "Loading ...".text.headline4(context).make(),
        ],
      ),
    );
  }
}
