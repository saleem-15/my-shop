import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../utils/constants/api.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/helpers.dart';
import '../../../storage/my_shared_pref.dart';

Future<void> getProfileInfoService() async {
  try {
    final response = await dio.put(
      USER_PATH,
    );

    final data = response.data['Data'];
    log(data.toString());

    final name = data['name'];
    final nickName = data['nick_name'];
    final email = data['email'];
    final phone = data['phone'];
    final dateOfBirth = data['date_of_birth'];

    MySharedPref.storeUserData(name, nickName, email, phone, dateOfBirth);
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data['Messages']),
    );
  }
}
