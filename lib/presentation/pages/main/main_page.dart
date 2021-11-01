import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/theme_util.dart';
import 'package:perizinan_petugas/presentation/core/widgets/fade_indexed_stack.dart';
import 'package:perizinan_petugas/presentation/pages/main/cubit/main_cubit.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/notification/notification_view.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/tanpa_izin/tanpa_izin_view.dart';

import 'views/home/home_view.dart';
import 'views/profile/profile_view.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/main';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIndexedStack(
        duration: ThemeUtil.shortAnimationDuration,
        index: context.select(
            (MainCubit element) => element.state.selectedMenuItemIndex),
        children: const [
          HomeView(),
          TanpaIzinView(),
          NotificationView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageAsset.icMenuHome,
              height: Sizes.height27,
            ),
            activeIcon: SvgPicture.asset(
              ImageAsset.icMenuHomeSelected,
              height: Sizes.height27,
            ),
            label: Strings.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageAsset.icMenuTanpaIzin,
              height: Sizes.height27,
            ),
            activeIcon: SvgPicture.asset(
              ImageAsset.icMenuTanpaIzinSelected,
              height: Sizes.height27,
            ),
            label: Strings.tanpaIzin,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageAsset.icMenuNotification,
              height: Sizes.height27,
            ),
            activeIcon: SvgPicture.asset(
              ImageAsset.icMenuNotificationSelected,
              height: Sizes.height27,
            ),
            label: Strings.notification,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageAsset.icMenuProfile,
              height: Sizes.height27,
            ),
            activeIcon: SvgPicture.asset(
              ImageAsset.icMenuProfileSelected,
              height: Sizes.height27,
            ),
            label: Strings.profile,
          ),
        ],
        currentIndex: context
            .select((MainCubit element) => element.state.selectedMenuItemIndex),
        onTap: (index) => _onTapBottomMenuItem(context, index),
      ),
    );
  }

  _onTapBottomMenuItem(BuildContext context, int index) {
    context.read<MainCubit>().changeBottomMenuItemIndex(index);
  }
}
