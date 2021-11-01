import 'package:flutter/material.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_colored_status_bar.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_search_user_field.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyColoredStatusBar(),
        MySearchUserField(
          onChanged: (value) => _onChangeSearchKeyword(context, value),
          onTapMic: () => _onTapMic(context),
        ),
      ],
    );
  }

  _onChangeSearchKeyword(BuildContext context, String value) {}

  _onTapMic(BuildContext context) {}
}
