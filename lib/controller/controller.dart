import 'package:autocomplete_func/data/repository/post_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:autocomplete_func/constants/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/DropDownList_model.dart';

class BuildingsController extends GetxController {
  final MyRepository repository;
  final RxList<DropdownList> dropdownList = RxList<DropdownList>([]);

  BuildingsController({required this.repository})
      : assert(repository != null);

  Future<List<Map<String, dynamic>>> getPropertyAutoComplete({
    required String actionId,
    required String searchText,
  }) async {
    try {
      EasyLoading.show(status: 'loading...');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userID = int.parse(prefs.getString(AppStrings.userId) ?? '0');
      int countryId = int.parse(prefs.getString(AppStrings.countryId) ?? '0');
      int orgSlId = int.parse(prefs.getString(AppStrings.orgSlId) ?? '0');
      String _lang = prefs.getString(AppStrings.lang)!;
      var moduleId;
      GetStorage box = GetStorage();
      if (box.read("isFromPageContact") == 'yes') {
        moduleId = '15';
      } else {
        moduleId = '12';
      }
      Map<String, dynamic> query = {
        "ActionID": actionId,
        "KeyValue": searchText,
        "CountryID": countryId,
        "OrgSLIID": orgSlId,
        "Lang": _lang,
        "UserID": userID,
      };

      var data = await repository.getPropertyNameAutoComplete(query);
      print(data);

      print('original length getPropertyNameAutoComplete');
      print(data);

      EasyLoading.dismiss();
      return data;
    } catch (e) {
      EasyLoading.dismiss();
      print("exception: " + e.toString());
      return [];
    }
  }
}