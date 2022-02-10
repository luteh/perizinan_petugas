import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/style/sizes.dart';
import '../../../../../../core/widgets/my_error_widget.dart';
import '../../cubit/notification_cubit.dart';
import 'notification_list_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      buildWhen: (previous, current) =>
          previous.fetchNotifications != current.fetchNotifications,
      builder: (context, state) {
        return state.fetchNotifications.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (data) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<NotificationCubit>().fetchNotifications();
              },
              child: ListView.separated(
                // shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.width20,
                  vertical: Sizes.height49,
                ),
                itemBuilder: (context, index) {
                  return NotificationListItem(notification: data[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: Sizes.height31,
                  );
                },
                itemCount: data.length,
              ),
            );
          },
          error: (failure) {
            return MyErrorWidget(
              failure: failure,
              onPressRetry: () {
                context.read<NotificationCubit>().fetchNotifications();
              },
            );
          },
        );
      },
    );
  }
}
