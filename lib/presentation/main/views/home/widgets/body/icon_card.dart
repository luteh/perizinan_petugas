import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';

class IconCard extends StatelessWidget {
  final String imageAsset;
  final Function() onTap;
  const IconCard({
    Key? key,
    required this.imageAsset,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
    );
  }
}
