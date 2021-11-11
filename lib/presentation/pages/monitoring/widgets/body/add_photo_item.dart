import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/form_builder_util.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/input_monitoring_data.dart';
import 'package:perizinan_petugas/presentation/core/base_widget_class.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_card.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_form_field.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring/cubit/monitoring_cubit.dart';

class AddPhotoItem extends StatelessWidget with BaseWidgetClass {
  final int index;
  final InputMonitoringData inputMonitoringData;
  const AddPhotoItem({
    Key? key,
    required this.index,
    required this.inputMonitoringData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.width18,
      ),
      child: Row(
        children: [
          Stack(
            children: [
              MyCard(
                child: Builder(builder: (context) {
                  if (inputMonitoringData.imageFile == null) {
                    return Icon(
                      Icons.hide_image_outlined,
                      size: Sizes.width80,
                      color: ColorPalettes.grey50,
                    );
                  }

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.radius10),
                    child: Image.file(
                      inputMonitoringData.imageFile!,
                      width: Sizes.width80,
                      height: Sizes.width80,
                      fit: BoxFit.cover,
                    ),
                  );
                }),
                shadowColor: Colors.black.withOpacity(0.16),
                blurRadius: Sizes.radius10,
                offset: const Offset(0, 2),
                margin: EdgeInsets.only(
                  right: Sizes.width20,
                  bottom: Sizes.height5,
                ),
              ),
              Positioned(
                right: 14,
                bottom: 0,
                child: ClipOval(
                  child: Material(
                    color: ColorPalettes.bgRed,
                    child: InkWell(
                      onTap: () => _onTapPhotoIcon(context),
                      child: Padding(
                        padding: EdgeInsets.all(Sizes.width5),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: Sizes.width14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: MyFormField(
              label: Strings.keterangan,
              hint: Strings.masukkanKeterangan,
              maxLines: 3,
              validator: FormBuilderValidators.compose([
                FormBuilderUtil.emptyValidator(context),
              ]),
              name: '${Strings.keterangan}$index',
              onChanged: (value) => _onChangeKeterangan(context, value),
            ),
          ),
        ],
      ),
    );
  }

  _onTapPhotoIcon(BuildContext context) {
    showImagePicker(
      context,
      onImagePicked: (file) {
        context
            .read<MonitoringCubit>()
            .inputMonitoringItemImage(index: index, imageFile: file);
      },
    );
  }

  _onChangeKeterangan(BuildContext context, String value) {
    context
        .read<MonitoringCubit>()
        .inputMonitoringItemKeterangan(index: index, keterangan: value);
  }
}
