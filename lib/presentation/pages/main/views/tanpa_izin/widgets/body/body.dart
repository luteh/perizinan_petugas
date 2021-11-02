import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_icon_card.dart';
import 'package:perizinan_petugas/presentation/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/tanpa_izin/cubit/tanpa_izin_cubit.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_data/monitoring_data_page.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<TanpaIzinCubit, TanpaIzinState>(
          buildWhen: (previous, current) =>
              previous.putMarkerResult != current.putMarkerResult,
          builder: (context, state) {
            return GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(-6.1777942826873335, 106.97580143809319),
                zoom: 15,
              ),
              myLocationButtonEnabled: false,
              scrollGesturesEnabled: true,
              mapToolbarEnabled: false,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              markers: state.markers,
              onTap: (latLng) => _onTapMap(context, latLng),
            );
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: MyIconCard(
                  imageAsset: ImageAsset.icGps,
                  onTap: () => _onTapGps(context),
                  padding: EdgeInsets.only(
                    right: Sizes.width20,
                  ),
                ),
              ),
              PrimaryButton(
                text: Strings.konfirmasi,
                onPressed: () => _onPressConfirmation(context),
                margin: EdgeInsets.only(
                  bottom: Sizes.height22,
                  top: Sizes.height27,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _onTapMap(BuildContext context, LatLng latLng) {
    context.read<TanpaIzinCubit>().putMarker(latLng: latLng);
  }

  _onTapGps(BuildContext context) {}

  _onPressConfirmation(BuildContext context) async {
    await NavigationUtil.pushNamed(MonitoringDataPage.routeName);
  }
}
