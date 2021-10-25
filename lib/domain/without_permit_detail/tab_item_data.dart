import 'package:equatable/equatable.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';

class TabItemData extends Equatable {
  final int id;
  final String title;
  final String imageAssetPath;

  const TabItemData({
    required this.id,
    required this.title,
    required this.imageAssetPath,
  });

  @override
  List<Object?> get props => [id, title, imageAssetPath];

  static List<TabItemData> get items => const [
        TabItemData(
          id: 0,
          title: Strings.informasiUmum,
          imageAssetPath: ImageAsset.icInformasiUmum,
        ),
        TabItemData(
          id: 1,
          title: Strings.hasilMonitoring,
          imageAssetPath: ImageAsset.icHasilMonitoring,
        ),
      ];
}
