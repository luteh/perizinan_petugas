import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/presentation/main/views/home/widgets/body/action_buttons.dart';
import 'package:perizinan_petugas/presentation/main/views/home/widgets/body/home_maps.dart';
import 'package:perizinan_petugas/presentation/main/views/home/widgets/header/header.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        HomeMaps(),
        Align(
          alignment: Alignment.bottomRight,
          child: ActionButtons(),
        ),
        Header(),
      ],
    );
  }
}
