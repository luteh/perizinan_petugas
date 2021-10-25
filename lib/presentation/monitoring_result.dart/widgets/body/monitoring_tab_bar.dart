import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';

class MonitoringTabBar extends StatelessWidget {
  final TabController tabController;
  const MonitoringTabBar({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: ColorPalettes.primary,
      ),
      child: TabBar(
        controller: tabController,
        tabs: const [
          Tab(
            text: Strings.semua,
          ),
          Tab(
            text: Strings.sedangBerjalan,
          ),
          Tab(
            text: Strings.selesai,
          ),
        ],
      ),
    );
  }
}
