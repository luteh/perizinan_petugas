import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_card.dart';
import 'package:perizinan_petugas/domain/without_permit_detail/tab_item_data.dart';
import 'package:perizinan_petugas/presentation/without_permit_detail/widgets/header/tab_item.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _items = TabItemData.items;
    return MyCard(
      shadowColor: ColorPalettes.primary,
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.width19,
        vertical: Sizes.height7,
      ),
      margin: EdgeInsets.only(
        left: Sizes.width48,
        right: Sizes.width48,
        top: Sizes.height16,
      ),
      child: Row(
        children: _items.map((e) => Expanded(child: TabItem(data: e))).toList(),
      ),
    );
  }
}
