import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';

class MyIconCard extends StatelessWidget {
  final String imageAsset;
  final Function() onTap;
  final EdgeInsets? padding;
  const MyIconCard({
    Key? key,
    required this.imageAsset,
    required this.onTap,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Material(
        elevation: Sizes.radius2,
        borderRadius: BorderRadius.circular(Sizes.radius5),
        child: InkWell(
          borderRadius: BorderRadius.circular(Sizes.radius5),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(Sizes.width9),
            child: SvgPicture.asset(
              imageAsset,
              height: Sizes.height28,
            ),
          ),
        ),
      ),
    );
  }
}
