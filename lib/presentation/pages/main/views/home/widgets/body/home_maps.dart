import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../../core/utils/navigation_util.dart';
import '../../../../../../../domain/entities/monitoring/monitoring_entity.dart';
import '../../../../../../core/widgets/my_error_widget.dart';
import '../../../../../permission_detail/permission_detail_page.dart';
import '../../cubit/home_cubit.dart';

class HomeMaps extends StatelessWidget {
  const HomeMaps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.fetchMonitoringListResult !=
          current.fetchMonitoringListResult,
      builder: (context, state) {
        return state.fetchMonitoringListResult.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: (data) {
            return _buildMap(data);
          },
          error: (failure) {
            return MyErrorWidget(
              failure: failure,
              onPressRetry: () {
                context.read<HomeCubit>().fetchMonitoringList();
              },
            );
          },
        );
      },
    );
  }

  _buildMap(List<MonitoringEntity> data) {
    return GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(-6.1777942826873335, 106.97580143809319),
          zoom: 15,
        ),
        myLocationButtonEnabled: false,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
        markers: data
            .map(
              (e) => Marker(
                markerId: MarkerId('${e.submissionId}'),
                position: LatLng(e.latitude, e.longitude),
                infoWindow: InfoWindow(
                  title: e.submissionContactPersonName,
                  onTap: () => _onTapInfoWindowMarker(data),
                ),
              ),
            )
            .toSet()
        // <Marker>{
        //   Marker(
        //     markerId: const MarkerId('1'),
        //     position: const LatLng(-6.1777942826873335, 106.97580143809319),
        //     infoWindow: InfoWindow(
        //       title: 'Maria Genoveva Ashari',
        //       onTap: () => _onTapInfoWindowMarker(),
        //     ),
        //   ),
        // },
        );
  }

  _onTapInfoWindowMarker(List<MonitoringEntity> data) async {
    await NavigationUtil.pushNamed(PermissionDetailPage.routeName);
  }
}
