import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/widgets/my_text.dart';
import 'package:perizinan_petugas/domain/without_permit_detail/tab_item_data.dart';
import 'package:perizinan_petugas/presentation/without_permit_detail/cubit/without_permit_detail_cubit.dart';

class TabItem extends StatelessWidget {
  final TabItemData data;
  const TabItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTapItem(context),
      child:
          BlocSelector<WithoutPermitDetailCubit, WithoutPermitDetailState, int>(
        selector: (state) {
          return state.tabIndex;
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                data.imageAssetPath,
                height: Sizes.height31,
                color: data.id == state
                    ? ColorPalettes.primary
                    : ColorPalettes.grey2,
              ),
              MyText(
                text: data.title,
                margin: EdgeInsets.only(
                  top: Sizes.height8,
                ),
                color: data.id == state
                    ? ColorPalettes.primary
                    : ColorPalettes.grey2,
              )
            ],
          );
        },
      ),
    );
  }

  _onTapItem(BuildContext context) {
    context.read<WithoutPermitDetailCubit>().changeTabIndex(data.id);
  }
}
