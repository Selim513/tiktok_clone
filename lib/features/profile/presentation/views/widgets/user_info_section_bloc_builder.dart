import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_user_info_bloc/fetch_user_bloc_state.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_user_info_bloc/fetch_user_info_bloc.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/profile_view_image.dart';

class UserInfoSectionBlocBuilder extends StatelessWidget {
  const UserInfoSectionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserInfoBloc, FetchUserInfoBlocState>(
      builder: (context, state) {
        if (state.status == BlocStatus.success) {
          var user = state.userInfoEntity;
          print('-----------------------------------${user?.image}');
          return Column(
            spacing: 20.sp,
            children: [
              ProfileViewImage(imageUrl: user?.image ?? ''),
              Text(user?.name ?? '', style: AppFontstyle.bold30),
            ],
          );
        } else if (state.status == BlocStatus.fail) {
          return const Center(child: Text('Please check your Internet'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
