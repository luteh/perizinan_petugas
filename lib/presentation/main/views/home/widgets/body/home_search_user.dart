import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';

class HomeSearchUser extends StatelessWidget {
  const HomeSearchUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        left: Sizes.width20,
        right: Sizes.width20,
        top: Sizes.height40,
      ),
      elevation: Sizes.radius2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius10),
      ),
      child: TextField(
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          isDense: true,
          hintText: Strings.hintSearchUser,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Sizes.radius10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: Sizes.width15,
              right: Sizes.width10,
            ),
            child: SvgPicture.asset(ImageAsset.icSearch),
          ),
          prefixIconConstraints: const BoxConstraints(),
          suffixIcon: InkWell(
            onTap: () => _onTapMic(context),
            child: const Icon(
              Icons.mic,
              color: Colors.black,
            ),
          ),
        ),
        onChanged: (value) => _onChangeKeyword(context, value),
      ),
    );
  }

  _onChangeKeyword(BuildContext context, String value) {}

  _onTapMic(BuildContext context) {}
}
