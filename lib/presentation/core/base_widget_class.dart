import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/get_util.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/presentation/core/libraries/image_picker_util.dart';
import 'package:perizinan_petugas/presentation/core/widgets/loading_dialog.dart';

import 'libraries/permission_helper.dart';

mixin BaseWidgetClass {
  Flushbar showFlushbar(BuildContext context, String? title, String? message,
      {bool isTopPosition = false, dynamic thenEvent, bool isError = true}) {
    return Flushbar(
      title: message != null ? title : null,
      message: message ?? title,
      titleSize: Sizes.sp16,
      messageSize: message != null ? Sizes.sp14 : Sizes.sp16,
      backgroundColor: isError
          ? Colors.red.withOpacity(0.8)
          : ColorPalettes.primary.withOpacity(0.8),
      flushbarPosition:
          isTopPosition ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
      padding: EdgeInsets.all(Sizes.width15),
      isDismissible: false,
      animationDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 3),
    )..show(context).then((_) => thenEvent);
  }

  Future<void> showLoadingDialog() async {
    await GetUtil.showDialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
  }

  dismissDialog() {
    GetUtil.dismissDialog();
  }

  Future<void> showImagePicker(
    BuildContext context, {
    required Function(File) onImagePicked,
  }) async {
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Sizes.radius16),
            topRight: Radius.circular(Sizes.radius16),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Galeri'),
                    onTap: () async {
                      await PermissionHelper.requestPermissionStorage(
                        onGranted: () async {
                          final _galleryResult =
                              await ImagePickerUtil.pickGalleryImage();
                          _galleryResult.fold(
                            (l) => null,
                            (r) => onImagePicked(r),
                          );
                        },
                        onDenied: () {
                          showFlushbar(
                            context,
                            null,
                            'Akses penyimpanan dibutuhkan untuk memilih foto dari galeri',
                          );
                        },
                      );

                      NavigationUtil.popUntil();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Kamera'),
                  onTap: () async {
                    await PermissionHelper.requestPermissionCamera(
                      onGranted: () async {
                        final _galleryResult =
                            await ImagePickerUtil.pickCameraImage();
                        _galleryResult.fold(
                          (l) => null,
                          (r) => onImagePicked(r),
                        );
                      },
                      onDenied: () {
                        showFlushbar(
                          context,
                          null,
                          'Akses kamera dibutuhkan untuk mengambil foto dari kamera',
                        );
                      },
                    );

                    NavigationUtil.popUntil();
                  },
                ),
              ],
            ),
          );
        });
  }
}
