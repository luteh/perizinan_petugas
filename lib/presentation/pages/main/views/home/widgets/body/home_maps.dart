import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/presentation/pages/permission_detail/permission_detail_page.dart';

class HomeMaps extends StatelessWidget {
  const HomeMaps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      markers: <Marker>{
        Marker(
          markerId: const MarkerId('1'),
          position: const LatLng(-6.1777942826873335, 106.97580143809319),
          infoWindow: InfoWindow(
            title: 'Customer Name',
            onTap: () => _onTapInfoWindowMarker(context),
          ),
        ),
      },
    );
  }

  _onTapInfoWindowMarker(BuildContext context) async {
    await NavigationUtil.pushNamed(PermissionDetailPage.routeName);
  }
}
