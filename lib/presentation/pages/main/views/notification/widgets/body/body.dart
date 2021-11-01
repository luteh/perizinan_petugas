import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/main/views/notification/widgets/body/notification_list_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.width20,
        vertical: Sizes.height49,
      ),
      itemBuilder: (context, index) {
        return const NotificationListItem();
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: Sizes.height31,
        );
      },
      itemCount: 5,
    );
  }
}
