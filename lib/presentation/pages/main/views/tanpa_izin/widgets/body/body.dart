import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../../core/constants/image_asset.dart';
import '../../../../../../../core/constants/strings.dart';
import '../../../../../../../core/style/sizes.dart';
import '../../../../../../../core/utils/navigation_util.dart';
import '../../../../../../../domain/entities/monitoring_without_submission/monitoring_without_submission_entity.dart';
import '../../../../../../core/base_widget_class.dart';
import '../../../../../../core/widgets/my_icon_card.dart';
import '../../../../../../core/widgets/primary_button.dart';
import '../../../../../monitoring_data/monitoring_data_args.dart';
import '../../../../../monitoring_data/monitoring_data_page.dart';
import '../../cubit/tanpa_izin_cubit.dart';

class Body extends StatelessWidget with BaseWidgetClass {
  final List<MonitoringWithoutSubmissionEntity> monitoringWithoutSubmissions;
  const Body({Key? key, required this.monitoringWithoutSubmissions})
      : super(key: key);

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
    final _markers = context.read<TanpaIzinCubit>().state.markers;
    if (_markers.length <= monitoringWithoutSubmissions.length) {
      showFlushbar(context, null, 'Tandai titik pada map terlebih dahulu');
      return;
    }
    final _result = await NavigationUtil.pushNamed(MonitoringDataPage.routeName,
        arguments: MonitoringDataArgs(
          latitude: _markers.last.position.latitude,
          longitude: _markers.last.position.longitude,
        ));

    if (_result) {
      context.read<TanpaIzinCubit>().fetchMonitoringWithoutSubmissions();
    }
  }
}
