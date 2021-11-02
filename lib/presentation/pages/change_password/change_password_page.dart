import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/presentation/pages/change_password/change_password_args.dart';
import 'package:perizinan_petugas/presentation/pages/change_password/widgets/body/body.dart';

import 'cubit/change_password_cubit.dart';

/// Can send arguments as [ChangePasswordArgs]
class ChangePasswordPage extends StatelessWidget {
  static const String routeName = '/change-password';

  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isLoggedIn = context
        .select((ChangePasswordCubit element) => element.state.isLoggedIn);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.ubahKataSandi,
        ),
      ),
      body: Container(
        decoration: _isLoggedIn
            ? const BoxDecoration(color: Colors.white)
            : const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAsset.bgDamaiPutra),
                  fit: BoxFit.cover,
                ),
              ),
        child: Body(),
      ),
    );
  }
}
